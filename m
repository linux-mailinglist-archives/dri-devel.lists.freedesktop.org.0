Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FDD4AE4D5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 23:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BE910E4F8;
	Tue,  8 Feb 2022 22:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF2810E4F8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 22:42:46 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C73E8C0AC7;
 Tue,  8 Feb 2022 22:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1644360165; bh=omCzGAwbtqtMaP54dgtuiZxcHPEGIRmXNRVNpVCU9RA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=jgOeShQ1wCFXwYdUl7T725H/S6hZRlD3E9a6JCTeyeR1Mq2RexEy7pFsXHyltePGS
 1kC5J+UjMIf14oSpdSzJu4z/4CiHjM+cmmJ9r52y1EnaaRFetlyWWsFzYjMFqYGeHt
 uPfHSBuTEH3f0zISw/E8bgmsvMAFpLi2kXPpiIuCsyZ4rfNvASh6dxKBf9i1Ge0MbO
 89DD5f7q3qk/fOK8bd0z6pvRHquCxdkvXu05PZXt4ebGKbi5XIIiTx2Z0Ee4bYUhG/
 MeMYr4PvxSdkbplT5PTHotUGjgF5kH6JKi2NOb5vZdP5umXc903UE1x7g/qUmqrL5z
 OySEBzy5jijxw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id A2AD8A005C;
 Tue,  8 Feb 2022 22:42:41 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1141C80362;
 Tue,  8 Feb 2022 22:42:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="P67yM5KA";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyQ/46fEvokVEyGDr8fCHAHC95ZpkyqhMCiLTzKuE0z3yRpBqAda4tnitgcsbriUbsfZDSna1YmlAvc4CyBEf/Rwfso0AdX2Q6KS09RdPmY9tCnLmilNUEXsxj3LKUmCwqrQaNpEsT4UM3ftUXzZWvF0tTreMzcKBlAr7y4C9v4xC6/uGSFdS9HY1sIJc3axgSSsVCTeqqPCIV3KnEJp2otaLY76CviWwdCBAtZD7v+otsNZlx5uYKktULRhLBmIFRehWBEIgzLA79cm9FL3ivMFRjf4PIIGsdfT5a5z8FvVzJTdRiiELOspPDKvnhQKtxF9P5OVnBCuQVcGI6rD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omCzGAwbtqtMaP54dgtuiZxcHPEGIRmXNRVNpVCU9RA=;
 b=DSEFAknLwyEpocJzx/IgA2ZYa+4GuIY9nvwof4XD1RWpl0mFSadKVek8VYCmWMLfk5hkd4shMSo+bg4jwDwaKTWv1JU8+X+4ov4J6sGEMUCEY6WVNlQZsVHDgYRPWsyKEJUBOQOSI6xvq0dv7n3S9FdkAbcMcTonSg2JQ0ZrMmD8EiDT3slb7vNg9RccL32KBPeYWHCsBtizzpBQWTrRTB0x49091EL/qCdDDY18vs2nk6Wpg25C6kQAJ/QG3xXz6pTBDqfGDrkKCjxfN6Ak20BHxYbxOwgDRAq0rrOwroWqMHcbk6JutSD4nqh/mJ3hKGWBN1keVLsYIGtzv77KXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omCzGAwbtqtMaP54dgtuiZxcHPEGIRmXNRVNpVCU9RA=;
 b=P67yM5KABaHocnM6e/j2UjJhsHcT+bopteCt7L/iORTlBrhyo9EM/J6EiohTkDcHU+G1NMsM3At4R+lW23MlQqNNYGoN4XpqUTlQR07ycHWfItHqo8RDGwkrXHaMzJAJmVmVuNsVfOtmaF/z8g2o6fPZHNZUGzc384Mg16ywA+4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN6PR1201MB0147.namprd12.prod.outlook.com (2603:10b6:405:56::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 8 Feb
 2022 22:42:37 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 22:42:37 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: Kconfig CONFIG_FB dependency regression
Thread-Topic: Kconfig CONFIG_FB dependency regression
Thread-Index: AQHYF7+jJ2OaNYIQN0qLBwE4mmvJGKx/URMAgAAPEICAAAQRAIAAfiQAgAEPAICAAHuWgIABUBIAgAALfACAB1ffgIAACc0AgAAgrgA=
Date: Tue, 8 Feb 2022 22:42:36 +0000
Message-ID: <1aef3a8f-f93e-2824-6b6e-8df8a1460f15@synopsys.com>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
 <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
 <6743d6b1-13fe-9c83-f706-82338dd03897@synopsys.com>
 <7ed6137e-cf19-3614-9404-e89389411a8f@infradead.org>
 <992f01cc-eb0c-b503-f9b4-4a037c6cf67a@synopsys.com>
 <2434f050-b82c-03e6-ee8f-8c8799119815@infradead.org>
In-Reply-To: <2434f050-b82c-03e6-ee8f-8c8799119815@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11a370f5-4295-48b4-944e-08d9eb544e27
x-ms-traffictypediagnostic: BN6PR1201MB0147:EE_
x-microsoft-antispam-prvs: <BN6PR1201MB01470F4D840ACE884F9ECB78AA2D9@BN6PR1201MB0147.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S8RpvdyKwmTYvpBzL6oiAHcjZUADm5yFFIMD6KfdaiAXTjB8R30oLex669QmWc/eXKkQLIMcA93Lf3FBF7yeEQOYRUAMjplZvjagJL6s8g4ZjePoGLeG2P2UVUwqurhKa2LPUY5yzb+7eKOdNlXc/6SbsdKrMd2iXnS8rdWXw09gkltH7bydvKHzaBtJtWNYwCpEnfzZmqzmPysBpyvx8L28U4aPtcPjDqmS/0GKKWCsA4uqwlat5xQfbDwvQE5crrwWuhRhUBJWQB39WorCY9BUwvm+Rdryi55tebjplUuyqhreiNKI9hVAkHp61FqV/sjXQ7JehIYMSPCSYIuOkALGLcMkcHV2v3c8kCo+tFEMgcqgJ5maSco4g1IweOGdapbGTmzjzMdXVPeUrfbSFOmCDTnyaVHEzEKKQePKu1QorrxJSOWoa0/ed4C29tBySzBRpyE8p8OM1qTZWVSya30FMAPeXuhKrR0c9gdKNkmXRmDXL3QDP5+ULEYjyUHdjWIN9fM2ghRAycXImAjGGyNUcRdqeVwqAcpvqE71cn/x/uFG70A+9K1c2DMFWTGeF7lvUi/BFTywWOhIPFYHtQ27sohdkKnJi+RAitEbljFT5lsHVIcrUpx2shHz34+AxY6TUKv5AVg9EX9YbX7Z6ib2/WhHC8HKkUkYSnlwqAcGpsXPByxVvTeg2ACFNXYCUWD6OLCd5ruI9i+5H8qn9XdprNc7IkLe84s07HBcCR10iBKfBB9XmZfcI0+10gV9nK9tvF30RSp+ld34IVtaQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4791.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(86362001)(31696002)(38100700002)(122000001)(71200400001)(8936002)(5660300002)(6512007)(508600001)(53546011)(6506007)(316002)(54906003)(110136005)(6486002)(4326008)(64756008)(66446008)(66476007)(66556008)(8676002)(66946007)(76116006)(83380400001)(31686004)(186003)(26005)(36756003)(2906002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3pxZXNWS1lFSCtRMzBIcHVsd0dNVmFFbEFmd1Fid1FieVlZbnRpTU9PMStq?=
 =?utf-8?B?NWxaalRnb3lxSC9pWWErWDUwTkVOVFVYNlJLOVYvdFYrcDhVVWJOdzBXWnhW?=
 =?utf-8?B?N2NYd0tLd2RuMURNbFl0SWZxQUZST0NNUUxuWlZzOEVQKytRMUY3Y3hpWmpB?=
 =?utf-8?B?RmpjT3UyeTVkdFNwZE1ORE1adDdrYmo4U3JmRUdNejV3VVE3bGh2ekNKL0NK?=
 =?utf-8?B?Q3RNVTdudTc3amdqdis1NFdqWnV3MEg2c3RvYU5SRFRlQy94OFNPOTlBb1lL?=
 =?utf-8?B?bFpjQndBTmxNWHpVVnNPYkxwSmpzSmJweDhIMWNualY4QXlPTGQyZzhBc0JV?=
 =?utf-8?B?NmVudDNOMXd5UlhFUENFdkN2NHlCSll2M3lVYit3bDdESmFlYlVxaElKc0RV?=
 =?utf-8?B?RGk0TkovRFMvMjM1cCtMNEROd05KRmpmamI5YmN4eThQN1VrUzhmR3JxeGs1?=
 =?utf-8?B?NmFNdm43ZDE4RmZKZmJENGx2SkxiV2xDTVZRcnZiOTNsSjlXMTJHbjNVU0NR?=
 =?utf-8?B?elhWUXVlMEg5cENsTUVwdjlVaTVMQWhIb093akFrUnVjV1piODltWjdZT3Iv?=
 =?utf-8?B?eE45eWM3VVN6QzhQd2hCcVUwNnN0VVFiRlZ2STNmaGpRbXpmRkY0SnJlK2dj?=
 =?utf-8?B?cnI1T1BjeGpuZ3lCSWVOcWIwUFBUeDBNWDhXRFY4aTgwY3gzZGkzUi83dXVI?=
 =?utf-8?B?bGdhaHFtaVNHaGptNHZUYjIwc3J4YnBCRWNRQnlKRlVNMWVYRTA3WXd4SjY4?=
 =?utf-8?B?K29SRnpMbGdPTjZEZXlaNklycjk1b2ZnN0hGN0Z3d1BYOS9DOGhjRXkySmRy?=
 =?utf-8?B?L1pUT0lYU2FaR2lFRmFwKzFNUlF5bjdYczJSbmUwY01qY1Rna2cyeklrMmdM?=
 =?utf-8?B?UE9mY25JNWp1YlhhWnpjaHExLzZlZzRaN1NOOW13Yk5tMG1NV09OZ2d3ZW5H?=
 =?utf-8?B?d3FMZ2RZWmU5YzdtVTE4K1R4R1c0aTI1aWsyYXNvU2xTNjJhNnhUSFhIdktO?=
 =?utf-8?B?NnNiRGVBNUI3YTlpWUZPTFdoMHErVFNTSXZya1A5bDRub2UxdWY2bk9XRTVi?=
 =?utf-8?B?VWhYZ1ppSDhqL1R6a0g3ZE10b2xudG9nZ0NINTFDYXFCRDhiN2Z5N0FPWkI2?=
 =?utf-8?B?dlZvMjJuZHpiTGFpRHBpN1Rqejc4Q29sS3A1cGZNSGhyZzFYRDhING5aOFJv?=
 =?utf-8?B?SFFlY3RaVHVxSnlPeWxTTmhLcDA4TmRGSFpsZFFDSXExRGRyc1FqN1JvbEhF?=
 =?utf-8?B?Y2kxZ1NLTkFIeXlpSkx6N1JLeUlVQUlKNU95R1dmdnZIN0k2NWpHZkRDdmdY?=
 =?utf-8?B?YlVUTGtCeWlJZmFweExsWlBGNVVIL0QzU0dqbzI5WWtMMUJEWlI5VHlZV25o?=
 =?utf-8?B?NlZMTWFnamJBWmJEaW9XbXFzT2ZaWlJnVnFsWnc0VDY5WG5kL3pTa0pUazA0?=
 =?utf-8?B?eXRSRE1LekxEZjMwb1dnNHhUdVhIMm9ubHlUU2Y5MUpKcXNJcGo0SlhTd3kx?=
 =?utf-8?B?TU83SjF4N244K0xzRjlxekpIVUJnWkw3QkFneGZBOURmUHpXRCtBM1lsVS9q?=
 =?utf-8?B?Sjl5WGd1U3lzdjNxSmJUU0x0QmViT0V2c1gvbUgwWjd3cWtLYThBVzZnQ2dK?=
 =?utf-8?B?NGxzcW5tLzY1c1NReW5MdlMvU3k5SFd4bU1INmYxZ3lUUjExVndRNUlYVWEw?=
 =?utf-8?B?YUwrSHZUMWZlUmFRRjBBOTNYUFpkK3BkSTlWaXlzZGVrYVFzRDU1RXFGMnE4?=
 =?utf-8?B?bEJiSkJwZzBJNzB2L2tmZTYrdW5hS3pmUVJMTlF4ZkszeVR2TXNRejNsWFdj?=
 =?utf-8?B?VkV1NHdBNGQ2WDVuK1hISmVoSVlOaEZQRGptSmpUZ3Z1dlVsb0JCa3J2Q0Yv?=
 =?utf-8?B?b0tIZHhoUXZkU3JkcEpCd2lmalprUjlkZ2IxZU12a0FXTWhCSzQ4OU5uS1JR?=
 =?utf-8?B?cmdsNnpBbHJNb2ZXTXBQL3c4ZXQ5K042Rm5uditjM3BhNzNZOGV2NlF2M21Z?=
 =?utf-8?B?ZzBjOVRQVG5uelVWb0FtT1pqcEhTYjN5UUVEUTV6QzVYelJGd2s5OU9ScEw2?=
 =?utf-8?B?cmpvNVRVMDdTQ0JmTk44WnZxSWw0RGluSUtBK0RFY0FYMnFPbjV3V0N4anBz?=
 =?utf-8?B?cFl3NU1JVGVTT0tpR1ljTFk2R3BtNUMzN0FXQXZGa2tkb1NpNEN4SWR6VmJz?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A46C770B7ED3354597845BF5FA0AA3AC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a370f5-4295-48b4-944e-08d9eb544e27
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 22:42:37.0007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zv0LYmCujQvI/9nkI9tHuWSZ0GffUUG07gKqiZwkC58s8FkGg1dd6CyBylKVTQEqTNhnq0haHha5ydqWxhZlqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0147
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmFuZHkgRHVubGFwIHdyb3RlOg0KPiBIaS0tDQo+IA0KPiBPbiAyLzgvMjIgMTI6MTAsIFRoaW5o
IE5ndXllbiB3cm90ZToNCj4+IFJhbmR5IER1bmxhcCB3cm90ZToNCj4+Pg0KPj4+DQo+Pj4gT24g
Mi8zLzIyIDE5OjIxLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+Pj4+IEFybmQgQmVyZ21hbm4gd3Jv
dGU6DQo+Pj4+PiBPbiBUaHUsIEZlYiAzLCAyMDIyIGF0IDEyOjU1IEFNIFRoaW5oIE5ndXllbiA8
VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+Pj4+Pj4gQXJuZCBCZXJnbWFubiB3
cm90ZToNCj4+Pj4+Pj4gT24gV2VkLCBGZWIgMiwgMjAyMiBhdCAxOjE0IEFNIFRoaW5oIE5ndXll
biA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+PiBGYWJpbyBFc3Rl
dmFtIHdyb3RlOg0KPj4+Pj4+Pg0KPj4+Pj4+PiBDT05GSUdfRkIgc2hvdWxkIG5vdCBub3JtYWxs
eSBiZSBuZWVkZWQgZm9yIGJvb3RpbmcsIHNvIHVubGVzcw0KPj4+Pj4+PiB5b3UgaGF2ZSBhIGdy
YXBoaWNhbCBhcHBsaWNhdGlvbiBpbiB5b3VyIGluaXRyYW1mcyB0aGF0IHJlcXVpcmVzIHRoZSAv
ZGV2L2ZiMA0KPj4+Pj4+PiBkZXZpY2UgdG8gd29yaywgaXQgaXMgbm90IHN1cHBvc2VkIHRvIG1h
a2UgYSBkaWZmZXJlbmNlLg0KPj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gSSdtIG5vdCBzdXJlLCBi
dXQgaXQgc2VlbXMgbGlrZSB0aGUgc2V0dXAgd2UgaGF2ZSBpc24ndCB0aGUgb25seSBvbmUNCj4+
Pj4+PiB0aGF0IG5lZWRlZCBpdC4gRmFiaW8gYWxzbyBub3RlZCB0aGF0IHRoZSBpbXhfdjZfdjdf
ZGVmY29uZmlnIGFsc28gbmVlZHMNCj4+Pj4+PiB0byBoYXZlIENPTkZJR19GQiBzZXQuDQo+Pj4+
Pg0KPj4+Pj4gTm8sIHRoYXQgb25lIGlzIGRpZmZlcmVudDogdGhlIGNoYW5nZSBmb3IgaW14X3Y2
X3Y3X2RlZmNvbmZpZyB3YXMNCj4+Pj4+IGRvbmUgYmVjYXVzZSB0aGV5IGFjdHVhbGx5IHVzZSBh
IGZyYW1lYnVmZmVyIGNvbnNvbGUgb24gc29tZSBkZXZpY2VzLA0KPj4+Pj4gc28gdGhlIHBhdGNo
IGp1c3QgYWRkcyB0aGUgc3ltYm9sIHRvIGVuYWJsZSB0aGUgZHJpdmVycyB0aGV5IGFyZSB1c2lu
Zy4NCj4+Pj4+DQo+Pj4+PiBUaGlzIGlzIGV4cGVjdGVkIHdpdGggbXkgb3JpZ2luYWwgcGF0Y2gg
dGhhdCBkb2Vzbid0IGltcGxpY2l0bHkgZW5hYmxlDQo+Pj4+PiB0aGUgZnJhbWVidWZmZXIgbGF5
ZXIgYW55IG1vcmUuIFdoYXQgaXMgbm90IGV4cGVjdGVkIGlzIGZvciB0aGUga2VybmVsDQo+Pj4+
PiB0byBoYW5nIGR1cmluZyBib290IGFzIHlvdSByZXBvcnRlZCBmb3IgeW91ciB1bmlkZW50aWZp
ZWQgcGxhdGZvcm0uDQo+Pj4+Pg0KPj4+Pj4+PiBBcmUgdGhlcmUgYW55IG90aGVyIGRpZmZlcmVu
Y2VzIGluIHlvdXIgLmNvbmZpZyBiZWZvcmUgYW5kIGFmdGVyIHRoZSBwYXRjaD8NCj4+Pj4+Pj4g
SXQncyBwb3NzaWJsZSB0aGF0IHlvdSB1c2Ugc29tZSBvdGhlciBkcml2ZXIgdGhhdCBpbiB0dXJu
IGRlcGVuZHMgb24NCj4+Pj4+Pj4gQ09ORklHX0ZCLiBEb2VzIHlvdXIgbWFjaGluZSBoYXZlIGFu
eSBncmFwaGljYWwgb3V0cHV0IGRldmljZT8NCj4+Pj4+Pj4gSWYgeWVzLCB3aGljaCBkcml2ZXIg
ZG8geW91IHVzZT8NCj4+Pj4+Pg0KPj4+Pj4+IEkgZG9uJ3QgaGF2ZSB0aGUgYW5zd2VyIHRvIHRo
b3NlIHF1ZXN0aW9ucyB5ZXQuIE5lZWQgbW9yZSBpbnZlc3RpZ2F0aW9uLg0KPj4+Pj4+IEknbSBu
ZXcgdG8gdGhpcyBwYXJ0aWN1bGFyIHRlc3Qgc2V0dXAuDQo+Pj4+Pg0KPj4+Pj4gRG8geW91IG1l
YW4geW91IGRvbid0IGtub3cgaWYgdGhlcmUgaXMgYSBzY3JlZW4gYXR0YWNoZWQgdG8gdGhlIHN5
c3RlbT8NCj4+Pj4+DQo+Pj4+DQo+Pj4+IEl0IGRvZXMgaGF2ZSBhIGdyYXBoaWNhbCBvdXRwdXQg
ZGV2aWNlLCBidXQgSSBkaWRuJ3QgY2hlY2sgd2hhdCBpdCBpcyBvcg0KPj4+PiB3aGF0IGRyaXZl
ciBpcyBkcml2aW5nIGl0LiBJIGp1c3Qgbm90aWNlIHRoYXQgYWZ0ZXIgdGhlIHJlcG9ydGVkIGNv
bW1pdCwNCj4+Pj4gc29tZXRoaW5nIHN0b3BwZWQgd29ya2luZy4NCj4+Pj4NCj4+Pj4+Pj4NCj4+
Pj4+Pj4gWW91IG1heSBhbHNvIHdhbnQgdG8gbWFrZSBzdXJlIHRoYXQgeW91IGhhdmUgOWQ2MzY2
ZTc0M2YzICgiZHJtOg0KPj4+Pj4+PiBmYl9oZWxwZXI6IGltcHJvdmUgQ09ORklHX0ZCIGRlcGVu
ZGVuY3kiKSBpbiB5b3VyIGtlcm5lbCwgd2hpY2gNCj4+Pj4+Pj4gZml4ZXMgYSBtaW5vciBwcm9i
bGVtIHdpdGggbXkgb3JpZ2luYWwgcGF0Y2guDQo+Pj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+PiBUaGUg
aXNzdWUgYWxzbyBvY2N1cnMgaW4gbWFpbmxpbmUsIHdoaWNoIGhhcyB5b3VyIG1pbm9yIGZpeCBj
b21taXQNCj4+Pj4+PiBhYm92ZS4gVGhlIHJldmVydCBpc24ndCBjbGVhbiBmb3IgdGhlIGxhdGVz
dCBrZXJuZWwgdmVyc2lvbi4gSSBhbHNvIGhhdmUNCj4+Pj4+PiB0byByZXZlcnQgc29tZSBvZiB0
aGUgY2hhbmdlcyBhbG9uZyB3aXRoIENPTkZJR19GQi4gVGhlIHJldmVydCBsb29rcw0KPj4+Pj4+
IG1vcmUgbGlrZSB0aGlzIGZvciB0aGUgbGF0ZXN0IGtlcm5lbDoNCj4+Pj4+Pg0KPj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9LY29u
ZmlnDQo+Pj4+Pj4gaW5kZXggYjFmMjJlNDU3ZmQwLi43Y2JjNzMzYTg1NjkgMTAwNjQ0DQo+Pj4+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCj4+Pj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vS2NvbmZpZw0KPj4+Pj4+IEBAIC0xMTgsOCArMTE4LDkgQEAgY29uZmlnIERSTV9ERUJV
R19NT0RFU0VUX0xPQ0sNCj4+Pj4+Pg0KPj4+Pj4+ICBjb25maWcgRFJNX0ZCREVWX0VNVUxBVElP
Tg0KPj4+Pj4+ICAgICAgICAgYm9vbCAiRW5hYmxlIGxlZ2FjeSBmYmRldiBzdXBwb3J0IGZvciB5
b3VyIG1vZGVzZXR0aW5nIGRyaXZlciINCj4+Pj4+PiAtICAgICAgIGRlcGVuZHMgb24gRFJNX0tN
U19IRUxQRVINCj4+Pj4+PiAtICAgICAgIGRlcGVuZHMgb24gRkI9eSB8fCBGQj1EUk1fS01TX0hF
TFBFUg0KPj4+Pj4+ICsgICAgICAgZGVwZW5kcyBvbiBEUk0NCj4+Pj4+PiArICAgICAgIHNlbGVj
dCBEUk1fS01TX0hFTFBFUg0KPj4+Pj4+ICsgICAgICAgc2VsZWN0IEZCDQo+Pj4+Pj4gICAgICAg
ICBzZWxlY3QgRkJfQ0ZCX0ZJTExSRUNUDQo+Pj4+Pj4gICAgICAgICBzZWxlY3QgRkJfQ0ZCX0NP
UFlBUkVBDQo+Pj4+Pj4gICAgICAgICBzZWxlY3QgRkJfQ0ZCX0lNQUdFQkxJVA0KPj4+Pj4+DQo+
Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IEkgYXR0YWNoZWQgdGhlIGNvbmZpZ3MgZm9yIGtlcm5lbCB2
NS4xNy1yYzEuIFRoZSAiYmFkIiBjb25maWcgaXMgd2l0aG91dA0KPj4+Pj4+IGFueSByZXZlcnQs
IHRoZSAiZ29vZCIgY29uZmlnIGlzIHdpdGggdGhlIGNoYW5nZSBhYm92ZS4NCj4+Pj4+DQo+Pj4+
PiBMb29raW5nIGF0IHRoZSBjb25maWcsIEkgc2VlIHRoYXQgdGhpcyBpcyBmb3IgYW4geDg2IG1h
Y2hpbmUsDQo+Pj4+PiBhbmQgeW91IGhhdmUgdGhlIEZCX0VGSSBkcml2ZXIgYW5kIEVGSV9FQVJM
WUNPTiBlbmFibGVkLg0KPj4+Pj4NCj4+Pj4+IFdoYXQgSSBzdXNwZWMgaXMgZ29pbmcgb24gaXMg
dGhhdCB5b3UgYXJlIGxvb2tpbmcgYXQgYSBzY3JlZW4gcmF0aGVyDQo+Pj4+PiB0aGFuIGEgc2Vy
aWFsIGNvbnNvbGUsIGFuZCB0aGUga2VybmVsIGRvZXNuJ3QgYWN0dWFsbHkgaGFuZyBidXQgeW91
DQo+Pj4+PiBqdXN0IGRvbid0IHNlZSBhbnkgbW9yZSBtZXNzYWdlcyBhZnRlciB0aGUgRFJNIGRy
aXZlciB0YWtlcw0KPj4+Pj4gb3ZlciBmcm9tIEVGSV9FQVJMWUNPTiBiZWNhdXNlIHRoZXJlIGlz
IG5vIGNvbnNvbGUgZHJpdmVyLg0KPj4+Pj4NCj4+Pj4+IEluIHRoaXMgY2FzZSwgd2hhdCB5b3Ug
c2VlIGlzIHRoZSBpbnRlbmRlZCBiZWhhdmlvciwgbm90IGEgYnVnLg0KPj4+Pj4gSWYgeW91IHdh
bnQgYSBncmFwaGljYWwgY29uc29sZSBpbiB5b3VyIHN5c3RlbSwgeW91IG5lZWQgdG8NCj4+Pj4+
IGVuYWJsZSB0aGUgc3VwcG9ydCBmb3IgdGhpcyBpbiB5b3VyIGNvbmZpZy4NCj4+Pj4+DQo+Pj4+
DQo+Pj4+IEl0IHNvdW5kcyBsaWtlIHRoYXQncyB0aGUgY2FzZS4gVW5mb3J0dW5hdGVseSBJJ20g
bm90IGZhbWlsaWFyIHdpdGggdGhpcw0KPj4+PiBzdWJzeXN0ZW0gdG8gc2F5IHRoYXQncyB3aGF0
IGhhcHBlbmluZy4gSWYgdGhlcmUncyBub3RoaW5nIGFjdHVhbGx5DQo+Pj4+IGJyb2tlbiBmcm9t
IHJldmlldywgd2UgY2FuIGlnbm9yZSB0aGlzIGVtYWlsIHRocmVhZC4NCj4+Pg0KPj4+IEhpLA0K
Pj4+IEkgZG9uJ3Qga25vdyBvZiBhbnl0aGluZyB0aGF0IGlzIGJyb2tlbi4uLg0KPj4+DQo+Pj4g
SSBhbSBjdXJpb3VzIGhvdyBDT05GSUdfRkJfRUZJIGNhbWUgdG8gYmUgc2V0IHdoZW4gZ29pbmcg
ZnJvbSBiYWQuY29uZmlnIHRvDQo+Pj4gZ29vZC5jb25maWcuICBDYW4geW91IGV4cGxhaW4gdGhh
dD8NCj4+Pg0KPj4NCj4+IEkganVzdCB1c2UgdGhlIGNoYW5nZSBhYm92ZSBhbmQgIm1ha2UiIHdp
dGggb2xkZGVmY29uZmlnIG9wdGlvbi4gSXMgaXQNCj4+IG5vdCBleHBlY3RlZD8NCj4gDQo+IE1h
eWJlIEkgYW0gbm90IGRvaW5nIHRoZSBzYW1lIGFzIHlvdS4gSWYgSSB0YWtlIHlvdXIgcHJldmlv
dXMgYmFkLmNvbmZpZw0KPiB3aXRoIGtlcm5lbCB2NS4xNy1yYzIgYW5kIHVzZSB5b3VyIEtjb25m
aWcgcGF0Y2g6DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcgYi9k
cml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPiBpbmRleCBiMWYyMmU0NTdmZDAuLjdjYmM3MzNhODU2
OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL0tjb25maWcNCj4gQEAgLTExOCw4ICsxMTgsOSBAQCBjb25maWcgRFJNX0RFQlVH
X01PREVTRVRfTE9DSw0KPiANCj4gIGNvbmZpZyBEUk1fRkJERVZfRU1VTEFUSU9ODQo+ICAgICAg
ICAgYm9vbCAiRW5hYmxlIGxlZ2FjeSBmYmRldiBzdXBwb3J0IGZvciB5b3VyIG1vZGVzZXR0aW5n
IGRyaXZlciINCj4gLSAgICAgICBkZXBlbmRzIG9uIERSTV9LTVNfSEVMUEVSDQo+IC0gICAgICAg
ZGVwZW5kcyBvbiBGQj15IHx8IEZCPURSTV9LTVNfSEVMUEVSDQo+ICsgICAgICAgZGVwZW5kcyBv
biBEUk0NCj4gKyAgICAgICBzZWxlY3QgRFJNX0tNU19IRUxQRVINCj4gKyAgICAgICBzZWxlY3Qg
RkINCj4gICAgICAgICBzZWxlY3QgRkJfQ0ZCX0ZJTExSRUNUDQo+ICAgICAgICAgc2VsZWN0IEZC
X0NGQl9DT1BZQVJFQQ0KPiAgICAgICAgIHNlbGVjdCBGQl9DRkJfSU1BR0VCTElUDQo+IA0KPiBh
bmQgdGhlbiBydW4NCj4gJ21ha2Ugb2xkZGVmY29uZmlnJywgSSBzZWU6DQo+IA0KPiAjIENPTkZJ
R19GQl9FRkkgaXMgbm90IHNldA0KPiANCj4gd2hpY2ggaXMgd2hhdCBJIHdvdWxkIGV4cGVjdCB0
byBzZWUuDQo+IA0KDQpBaC4uIEl0J3MgYmVjYXVzZSBJIGRvbid0IHVzZSBvbGQuY29uZmlnIGFz
IHRoZSBiYXNlIGNvbmZpZy4gSSB1c2UNCng4Nl82NF9kZWZjb25maWcgYXMgdGhlIGJhc2UgcGx1
cyBzb21lIGFkZGl0aW9uYWwgY29uZmlncyBJIG5lZWQsIGFuZCBpdA0KaGFzIENPTkZJR19GQl9F
Rkkgc2V0IGJ5IGRlZmF1bHQuDQoNCkJSLA0KVGhpbmgNCg0K
