Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102517E916B
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 16:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A71610E067;
	Sun, 12 Nov 2023 15:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC2A10E067;
 Sun, 12 Nov 2023 15:29:57 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly14b.srv.mailcontrol.com (MailControl) with ESMTP id 3ACFTbbd178312;
 Sun, 12 Nov 2023 15:29:37 GMT
Received: from rly14b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender ttayar@habana.ai) (MIMEDefang) with ESMTP id
 3ACFTZxh178180
 (TLS bits=256 verify=OK); Sun, 12 Nov 2023 15:29:37 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly14b.srv.mailcontrol.com (MailControl) id 3ACFSn8r170418;
 Sun, 12 Nov 2023 15:28:49 GMT
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by rly14b-eth0.srv.mailcontrol.com (envelope-sender ttayar@habana.ai)
 (MIMEDefang) with ESMTP id 3ACFSmVo170322
 (TLS bits=256 verify=OK); Sun, 12 Nov 2023 15:28:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G45aUy1WqIovQB/Z9Wp9B+2MUQ4orsLU1s7DvPVtbrpxWhBgQ55OrX+bm8Y1vB0RbYkvQp+Z1chJCNJMXGEYzvNStpzx+M72w7ew4hZlVe28/A22TnKDMS7tbyhZksJpCAyQKfgsj1/yv7+YGfVnNENWF3H2HszFKVmd1SAanfG6HUauu80F0JF/2EUWtgoonkaOAcuSSp0nXWtUX2EfX5/iUupgPvW8rpdHMxAYRwQiB8vCuyZs1L0bysCk9uPKfbRWzVc9xqkh8zFPimhZuwWQoRTY6HTFtsDv6rvF58/ZOq/x3LtCyMTLXohlFeOms28NNMkzgZrvggSfhuYnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKqMPndR/2FS7E9IBReIeuUnFSFnZxdNiIOQIv43uPw=;
 b=BCb+0CI1M8E2rP/FqnDA/AI6tUzkekA5U/mDp/6Ha1WvopksMOzDDIM4lHb7xY4C5ZanTS7lHdzQWNSmmT20Z+LI8+3TnBPtoLmg9fx7iKMLBztLXkUsWRQW9XgrYkczpK21rLF93m5+/+wKYKR23iq/oTSscBIn+kGk9eQjRMO8ks9qhTY7NGetQX9i4LqsJBSur2WqkEKVeRjORJBWBkEXBVRhphNB8FB5CGQs2g1klJgFRLDf69vdXlYK99KV0M1FUbGwnnND6QPMs0buduFXyfXgV+Cq9mt2k3AghKSQuCbXwxhcIyCTY/ksql8Qgof7fdVHJQ6L+MOWnKuJqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKqMPndR/2FS7E9IBReIeuUnFSFnZxdNiIOQIv43uPw=;
 b=gWKCyj4osOhq2Ur8XlK2b7bcM8HFo/11CxNAPQDZ1njqNxcmajKAy05QUYlkbqXA0mqEId/zkgurM9ZFlXOgF0kSBoujhSrOMy/awOSVhqXihZBa984551G+YkI/fjoAwknHhDBOxguFPYH6KZIXgPyoOXH9/somVxBrOIkBbFHX/QU86mnaWm6x++c5LuXNYqVhqF1fvYoEUGMV4B+UgWyxdhv7uGMfBPPA/oSZcLM0VHQv99PpOoYvkvq6Jpk8/RIOPhrU5P3lTTQ3dUSW9JMAvoU26oc3rKziBJE89cEqm5/selBokslcMO8oAvIxmLiWmEl9BBmaTfocCRdmsw==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by VI1PR02MB5805.eurprd02.prod.outlook.com (2603:10a6:803:133::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Sun, 12 Nov
 2023 15:28:46 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::8ce1:e2a8:6500:bea8]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::8ce1:e2a8:6500:bea8%6]) with mapi id 15.20.6977.028; Sun, 12 Nov 2023
 15:28:46 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>, "Hawking.Zhang@amd.com"
 <Hawking.Zhang@amd.com>, "Harish.Kasiviswanathan@amd.com"
 <Harish.Kasiviswanathan@amd.com>, "Felix.Kuehling@amd.com"
 <Felix.Kuehling@amd.com>, "Luben.Tuikov@amd.com" <Luben.Tuikov@amd.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: Re: [RFC v2 5/5] drm/xe/RAS: send multicast event on occurrence of an
 error
Thread-Topic: [RFC v2 5/5] drm/xe/RAS: send multicast event on occurrence of
 an error
Thread-Index: AQHaA234AfKqUIbn90i9Sv0wgezag7Bzm8IAgANXO4A=
Date: Sun, 12 Nov 2023 15:28:46 +0000
Message-ID: <e58e5753-d501-4a5a-86be-4cdebc31a287@habana.ai>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <20231020155835.1295524-6-aravind.iddamsetty@linux.intel.com>
 <825661de-922f-459e-b667-b95aa0df7f46@habana.ai>
In-Reply-To: <825661de-922f-459e-b667-b95aa0df7f46@habana.ai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|VI1PR02MB5805:EE_
x-ms-office365-filtering-correlation-id: a4229c1d-94a4-4f88-54f7-08dbe3940fef
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5+4xJjCcynZkTqUlBJX048QHIui/WeTGxfcc0FK82xAWJLIe27JDozb1FW27jpjs1vKw+hu2eHqCwJqACJn4QfH7nsOLqF9sKkMi/up3LoWKL3Wz3pRcNCInQMCxZ0jYgTxVQqbyYo6mcC+nUd2ze8Xvvq4vv3nTKjso8fAlgkkKcL34TJnuOMJb2+o0G+w165HGwHJYHtfNJO/gJVbAW5I0S2lZVozd2sQlPlXB5oaXs59aN1X44R8x9W0dcm9vUNoqPsPneF2+PrVq+T+e+vulBB31/fHTu/+DnDJ1SxwpnHyD4sWLdDa/t9VP5N8Migb088+mr3rLNtT/Xyd0RJ6pANx4L+Wf9AQ9phcxeg+yGuIgScBWdkHvXNm2c8dnPkKMzINFmLXD/5INpZRMfef5tmCiaAV/INQ365rBMlbFsRkyee9bMzXgkSsutNaYfT9gmbF7LlXS5voxd2ZsprmU9XWtWM50hkACP+OdBBrU1lKMFeSGus0SIEd2u1IkZ+zdFk4sligDRW++Sckw0ik9ZRY4S6tNQl9KEnbdrKu3GgsiDd3y6fjhxa/PNzQ48+0wpiv7PdqI4TTKCWVdrjqmsixZy2/8A4xDFsRBwJZphrI/qikcKZ/s3qxjYJNe+jnP89StkZV8yVRjDSvbsiOFscme5iLGIDvgsLMWRU617SKvpvq8Fi+cpfABgBUskSFh03/XXYOaj/yFoKBBMQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39840400004)(396003)(376002)(346002)(136003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(53546011)(83380400001)(38100700002)(6506007)(31686004)(82960400001)(86362001)(8936002)(8676002)(2616005)(41300700001)(122000001)(66899024)(6512007)(2906002)(7416002)(31696002)(64756008)(76116006)(66556008)(71200400001)(66446008)(66476007)(36756003)(921008)(316002)(91956017)(66946007)(5660300002)(26005)(110136005)(6486002)(478600001)(38070700009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTYwMXRIUjY5U2FJc1FwWGJralcrUEU1a2lDMDZGMWl5eXBMNEVXcGxmTGpw?=
 =?utf-8?B?Q01sdXhOS0MvRmowTm9zMUdzcWFmcmRnL2JzWWhtS2l4eWhJNHErK0VJYWh3?=
 =?utf-8?B?VWgybW1lWVdJdWUvZUlpYVpCdWlIM0VHaVN4VmxQejZYUTY0ei9Vcjl1R3ha?=
 =?utf-8?B?NVYxazA3eXNpUGswaitrcFNncndMa3BCd1NNM3RxV1FKMmRSM1RPazZGemE3?=
 =?utf-8?B?eFMyMzdUQTRqM0ZLNUlDaWh0VTE2U1paYzA2bWp2TXNUT3ZEOWVrTXUxbFpi?=
 =?utf-8?B?NTRVMDFZSElyaEhrTnNyU3FtVlNtbDNhcWllRCszYnQwaThWQ1NJMXRXY3hK?=
 =?utf-8?B?bU5iSUhlRVJFbUNxWnQvZlgzSFptY01EdkdzM1hteFQzci9LVENFM0NpU3My?=
 =?utf-8?B?TE54QTJSM2lTMGFPclYvSXNDK25tS3BvL3ZmUEt0VVNaemxnSzZMTThNL3JT?=
 =?utf-8?B?UVRCMG1RSDN1d0JiRGl6WWF4YzFqcEtDb0YvanJ4OHdsTkUzWTdSYmQzQUZC?=
 =?utf-8?B?eXJYR08rVjVyZElUaTBtSE1FV3l1bUVjbG9FbWFtRTFrb1B0OWUrMEtSYnln?=
 =?utf-8?B?ME9HRXVwQ0ZlWFlMeDNCQkU0OWlBT3dDLy9lUGlVT2JkVWdySGNYOG45N0Ur?=
 =?utf-8?B?Y2E3WWNTZE9kUTNZSDc0V3hRRzFKNFZCdlY3TU1vSmZoVW9IT001RnRNYjE2?=
 =?utf-8?B?ZEtsWFd4OE10cHZMWVJXRjdWYTdhTFYwWlZ4dHhnakl4dWhYWHV4aituYk5p?=
 =?utf-8?B?TnQrRkI2emtScEpjaUJDRHRHUC8yVG83TSsrUTFXbmdJMCtIZS9STm5KWXRE?=
 =?utf-8?B?QytWUjdXVitZM3ZXYnI1WHdocldLYjg2d0JYaEZTVDJIYzQ2cHJrMGZDWk83?=
 =?utf-8?B?VnhMNHJtMjNOUlA0VVFId3AwUUZ5dXNGM0NWNkx1Y2k3QmZTaHgrbEIvQ1JC?=
 =?utf-8?B?SUpNNnoxWk5qeml4ZGl1cGpRcGsxQ0lXYUhycXBHczZMZGpaUS90c0sxQ08w?=
 =?utf-8?B?Q09vV3d3ZkdnQU0yUzYydlc0bE1pYncwTlBKc0gxNkNDOXZaYXdrai9hbDVM?=
 =?utf-8?B?eS9IeHFrdWJkbTRmL2hMZ3RHUlpHbDlyNGtxaHJnSFlGV3diTGtqcjhJcmMx?=
 =?utf-8?B?dGJteStoZ201MG9Ga2g0OGtYVnRpMzJsand0eXh1WTU5NFRlSCsyRkxvNDBL?=
 =?utf-8?B?Z0kvdEhWcTRBTDFBR2w4ZjZnQU1iV1hoMzlaajFxKzRMUHREK2RsNHJTenpn?=
 =?utf-8?B?M3dCS2drOGcyTGxFQk1ESnBGNEVzSFJWR3hlWS9kM3liMmw3T2YzSklGQWsz?=
 =?utf-8?B?YmJuT2tnVlNqZWJqM2ViRzQvQnN2cDFsSFRxV2xISWl1RXZDbW55YjdzYXIv?=
 =?utf-8?B?SitGUC9vSmZaZklTUmttWHdEbjMzdmNUM1JGWk5ia3FTS2pGZ3h1a08rTDZH?=
 =?utf-8?B?UnBPNnYxZkFBbmxBOEs5UHlFVkViYy9tRlEzTFA3Q2prMTdHWms2M0p3ZGdl?=
 =?utf-8?B?QzEvdGFCRjkycy9ldjgraUV5NWFNUlVDSEFSaVh6aU44T0RNK1JWVHVkV3BT?=
 =?utf-8?B?YTBlWG5qVVlQV09YbUtoazVVU0lOLzY3dXMxckwwVmY5QTl0YWJULzR2TEZa?=
 =?utf-8?B?cWZGajNWb2xFTHlyRnZQbzZLbTc0SnY1T24wNVNjbjZDOGp6bXFjekg3bWQz?=
 =?utf-8?B?ZnlDdXUyWFBDUXBpalhlVkVFSDNQVmxSQVhiZUI1U05iVzRDVmpwd2FaSmMr?=
 =?utf-8?B?MCs1R1hCQ2lLKzBOdEc3WlM1OVA1M0pPUUUrcmNKbVlIaG5LRkd3SnZHSDBi?=
 =?utf-8?B?dWVyZUNwNUtZQlRQM28xeDRhNC9wd2IwT3NMbFBMaklyTDFCUHN5K3NnOHJv?=
 =?utf-8?B?TXlUT1VqMVpwaU5GTHNQcm8wTVpuWVMxNzBaQUd4aERheEd4cEtZbHlWZnpZ?=
 =?utf-8?B?TU9HbmhiTDA2Z0JRSUJ6V2FIR1pYSCtkblhwOW95K2pRMDFLcDZSS0MxbDg5?=
 =?utf-8?B?WGdtNk1DR3NXcUsyNTdNand3L3VibkJiOStrdW42dXpGTjd0eFRpZ24yM2Np?=
 =?utf-8?B?SGxBNjh4ZkhNUWhtRWtDSHlEYXhzcFBzWlg5ckhMTzNibE55bEE1UEFLOFo1?=
 =?utf-8?Q?r6Ns=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44B7CBECCB14B94CBB532F0AA1D93E02@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Tk1tSWhDQndqc0JQQW8wZVZIbGJpVnNXNEpQTzlLRjN0ZUxTU3hMeHBpUUs4?=
 =?utf-8?B?ZXJ5RVY0KzRJTDdGRUJ1QnpjMHoyYnovdVhEWFdYc0VWK2dMR0tDK3Ura3ho?=
 =?utf-8?B?emtWaTQrRkVteUhqOFFpWnYyb1FYQ1V3eWRCMlBZcEVsNmFOUUEreXMvdXZD?=
 =?utf-8?B?YXQ5M1NjM1BMVURRbWVNbmtjRnNDTEZPSlQ5SE8rTG5ZbDVubzU4QkhxTFQy?=
 =?utf-8?B?L1EvTXpHZmVSNGk4L3VybDIwRzZjWUpyY21oWFp2c0JCQXZ3UzFORE4vWDlv?=
 =?utf-8?B?NzY4RUd4Z3d4VmlJb0ZMVXFlbUdPMDNJVFJ2d0Z4amdrOHJKT01Za0xSTzNl?=
 =?utf-8?B?Ny9HTmdDbTVIcjAxbnBKdmFtdjEyS1hSMjU0djBWSjBrcGtBWTc3RXI1amMv?=
 =?utf-8?B?eS8veStMbFN6d1JMTDFrdk41a3hnakIvM1I5bmc3Z2wrc3g5SUtGeHNHbHcz?=
 =?utf-8?B?TFRVeWI1OElEYTkvd0xFUE1MMmkxRktIWFRuaXBIU1drUk9iS2FZbjliNnZR?=
 =?utf-8?B?RFRkWDZBUy9sdEwzYktydXpOaWhOekk4ZExlSDJtdzhTVHl0MTV1OEpPTkpt?=
 =?utf-8?B?RVVkTWRRaGxUVFI4V2ZqWmNHY3NRdVUxaE15WEtEUFU5VDZRaHM0VktTdlhD?=
 =?utf-8?B?Q3loTll1LzRZNnBwVDFzdjZIL0VOWVl0MUI1L216ak1sdUxuUURQSzVzMCta?=
 =?utf-8?B?Y0pRZFE2Z2gySmw3MGtvc3ZFa0lRblNxMjEyemZ0WW41SExoaHB4MktDQzdq?=
 =?utf-8?B?OUx3OU9zQWFoVXJEM2dvbFlWcUQzZkdZRnNNaTFUdFRyWkVrbDFUYzk4cmp4?=
 =?utf-8?B?L1cwdk5qN0phSmE0bzAzNzRyd3ZWellYd3FVdHQ2aitUSUNCUFM0bDEwUnZl?=
 =?utf-8?B?R0UwVXEzOUhCV3YwaFpYSUJIR0VjWWhKTFRjeXg2TFBpVmFJdU5MS3pOTXB0?=
 =?utf-8?B?eXJ5UUpOSlVhTXE2YUhDT1J0LzJBVVdIcVp4eTV0WHVvaGZ2bkEzK1R1RXZz?=
 =?utf-8?B?YzlVQTFWRVlrNGVLU0VWN2NsZ2Y1eDl2OVlKVlFyTlZjdU5Obk0zNTlRQU1X?=
 =?utf-8?B?RGdNVS9LMHkwclJ4eExzQjZ0MGJuWHhvL3ZxQnJMVi9jRUhxMGZrTjRaU3Ja?=
 =?utf-8?B?UnVvQ2k0Mk5oaUJ3eldYVHM5SHhaZ2kzUUJkdTVUN3dFY2N0NTVBTkd3VWNM?=
 =?utf-8?B?WC9LeU9QalMzRGlEVDc5SW9NOFMrbWhsbUpzWnZISmlNK0dPczlFcTVnMVA0?=
 =?utf-8?Q?M5N3BWkKkRMTlbx?=
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4229c1d-94a4-4f88-54f7-08dbe3940fef
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2023 15:28:46.4609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1QJsrZaqa1LYz5bHlFmywPfy84B2O9croTmUseVwj/Lo2m3ZTPfMOIY+bE/ynQNvqbkzlI4zdak2Aj2MuFWusA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5805
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5OTgwMjk3NjpGUEtleTEucHJpdjqvXL6Dt45SqjrJaaypRG7A0SQXDMyVM5+iY2GWkxge8ijlkdJqwOW83D9W/wbuxmgzziwLk6GtCJ04Nnrl0Y+8Iq/A1oPjG7BUl5TN/langXo+ticvFTBmnF/3UXeRXbDcTH56/K6VzuoWQE9k2RPSc9B9aOn+0ZmzD7Fpf2REZc9EWduLDYgFyfCwdrM4bLnwtQuJBFFLeYJDAoRJ9bciRhH4ONoV4hS+wksRpNl3pY2hWshUJv5U9z9OMW8qLerDiCYs5kL6Jxl9BAksuMW37AJxIPeSc8+kC5rdLB4pECjEwOPQFfJ9z3OzAmzKnB7CH51E+q9KOA/JyaGDSARx
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.12.51
X-Mailcontrol-Refers-To: 3ACFTZxh178180
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=yKqMPndR/2FS7E9IBReIeuUnFSFnZxdNiIOQIv43uPw=;
 b=pvgHVA2U27Q8S0Vxp3Ugsdp5vpP8Dohe4/nawp1nsi38I0fllv6COoCPpWeu1vdQmU2hHm2SrQgs/EVRNarcZvjidJqY3iZujgWHphSyBJxc6rCEzdPcbQhgIpOMXVMRx0bQV7h54WzXpzSvukWm8MHZVNtj034vzZEnQnQdh7la6Glfv/C3e5WTFOuogtQ9sgPdXu+jjmfk83bykqQjd5nBozVbNiOE0KC5CjDXwjqX0QwXYjmCRbLyqM3woWcuhBcs7PqdNL18ngzkX6ghMI7q26LuQr1aI8osgIoDWhOkGY9bNZ9V9Cjg5zFug/XX3zi1Dlb53Wff0pFI30b3Fg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMTEvMjAyMyAxNDoyNywgVG9tZXIgVGF5YXIgd3JvdGU6DQo+IE9uIDIwLzEwLzIwMjMg
MTg6NTgsIEFyYXZpbmQgSWRkYW1zZXR0eSB3cm90ZToNCj4+IFdoZW5ldmVyIGEgY29ycmVjdGFi
bGUgb3IgYW4gdW5jb3JyZWN0YWJsZSBlcnJvciBoYXBwZW5zIGFuIGV2ZW50IGlzIHNlbnQNCj4+
IHRvIHRoZSBjb3JyZXNwb25kaW5nIGxpc3RlbmVycyBvZiB0aGVzZSBncm91cHMuDQo+Pg0KPj4g
djI6IFJlYmFzZQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFyYXZpbmQgSWRkYW1zZXR0eTxhcmF2
aW5kLmlkZGFtc2V0dHlAbGludXguaW50ZWwuY29tPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfaHdfZXJyb3IuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZXJyb3IuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9od19lcnJvci5jDQo+PiBpbmRleCBiYWI2ZDRjZjBiNjkuLmIwYmVmYjVlMDFjYiAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lcnJvci5jDQo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZXJyb3IuYw0KPj4gQEAgLTc4Niw2ICs3ODYsMzcg
QEAgeGVfc29jX2h3X2Vycm9yX2hhbmRsZXIoc3RydWN0IHhlX3RpbGUgKnRpbGUsIGNvbnN0IGVu
dW0gaGFyZHdhcmVfZXJyb3IgaHdfZXJyKQ0KPj4gICAgCQkJCShIQVJEV0FSRV9FUlJPUl9NQVgg
PDwgMSkgKyAxKTsNCj4+ICAgIH0NCj4+ICAgIA0KPj4gK3N0YXRpYyB2b2lkDQo+PiArZ2VuZXJh
dGVfbmV0bGlua19ldmVudChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgY29uc3QgZW51bSBoYXJkd2Fy
ZV9lcnJvciBod19lcnIpDQo+PiArew0KPj4gKwlzdHJ1Y3Qgc2tfYnVmZiAqbXNnOw0KPj4gKwl2
b2lkICpoZHI7DQo+PiArDQo+PiArCWlmICgheGUtPmRybS5kcm1fZ2VubF9mYW1pbHkubW9kdWxl
KQ0KPj4gKwkJcmV0dXJuOw0KPj4gKw0KPj4gKwltc2cgPSBubG1zZ19uZXcoTkxNU0dfREVGQVVM
VF9TSVpFLCBHRlBfQVRPTUlDKTsNCj4+ICsJaWYgKCFtc2cpIHsNCj4+ICsJCWRybV9kYmdfZHJp
dmVyKCZ4ZS0+ZHJtLCAiY291bGRuJ3QgYWxsb2NhdGUgbWVtb3J5IGZvciBlcnJvciBtdWx0aWNh
c3QgZXZlbnRcbiIpOw0KPj4gKwkJcmV0dXJuOw0KPj4gKwl9DQo+PiArDQo+PiArCWhkciA9IGdl
bmxtc2dfcHV0KG1zZywgMCwgMCwgJnhlLT5kcm0uZHJtX2dlbmxfZmFtaWx5LCAwLCBEUk1fUkFT
X0NNRF9FUlJPUl9FVkVOVCk7DQo+PiArCWlmICghaGRyKSB7DQo+PiArCQlkcm1fZGJnX2RyaXZl
cigmeGUtPmRybSwgIm11dGxpY2FzdCBtc2cgYnVmZmVyIGlzIHNtYWxsXG4iKTsNCj4+ICsJCW5s
bXNnX2ZyZWUobXNnKTsNCj4+ICsJCXJldHVybjsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlnZW5sbXNn
X2VuZChtc2csIGhkcik7DQo+PiArDQo+PiArCWdlbmxtc2dfbXVsdGljYXN0KCZ4ZS0+ZHJtLmRy
bV9nZW5sX2ZhbWlseSwgbXNnLCAwLA0KPj4gKwkJCSAgaHdfZXJyID8NCj4+ICsJCQkgIERSTV9H
RU5MX01DQVNUX1VOQ09SUl9FUlINCj4+ICsJCQkgIDogRFJNX0dFTkxfTUNBU1RfQ09SUl9FUlIs
DQo+PiArCQkJICBHRlBfQVRPTUlDKTsNCj4gSSBhZ3JlZSB0aGF0IGhpZGluZy93cmFwcGluZyBh
bnkgbmV0bGluay9nZW5ldGxpbmsgQVBJL21hY3JvIHdpdGggYSBEUk0NCj4gaGVscGVyIHdvdWxk
IGJlIHNvbWV0aW1lcyByZWR1bmRhbnQsDQo+IGFuZCB0aGF0IGluIHNvbWUgY2FzZXMgdGhlIHNw
ZWNpZmljIERSTSBkcml2ZXIgd291bGQgaGF2ZSB0byAiZGlydCBpdHMNCj4gaGFuZHMiIGFuZCBk
ZWFsIHdpdGggbmV0bGluayAoZS5nLiBmaWxsX2Vycm9yX2RldGFpbHMoKSBpbiBwYXRjaCAjMyku
DQo+IEhvd2V2ZXIgbWF5YmUgaGVyZSBhIERSTSBoZWxwZXIgd291bGQgaGF2ZSBiZWVuIHVzZWZ1
bCwgc28gd2Ugd29uJ3Qgc2VlDQo+IGEgY29weSBvZiB0aGlzIHNlcXVlbmNlIGluIG90aGVyIERS
TSBkcml2ZXJzPw0KPg0KPiBUaGFua3MsDQo+IFRvbWVyDQoNCkFmdGVyIHJldGhpbmtpbmcsIGl0
IGlzIHBvc3NpYmxlIHRoYXQgZGlmZmVyZW50IERSTSBkcml2ZXJzIHdpbGwgbmVlZCANCnNvbWUg
ZmxleGliaWxpdHkgd2hlbiBpdCBjb21lcyB0byBjYWxsaW5nIGdlbmxtc2dfcHV0KCksIGFzIHRo
ZXkgbWlnaHQgDQp3YW50IHRvIGhhdmUgbW9yZSBvZiB0aGlzIGNhbGwgaW4gb3JkZXIgdG8gYXR0
YWNoIHNvbWUgZGF0YSByZWxhdGVkIHRvIA0KdGhlIGVycm9yIGluZGljYXRpb24uDQpJbiB0aGF0
IGNhc2UsIGFkZGluZyBhIERSTSBmdW5jdGlvbiB0aGF0IHdyYXBzIGl0IG1heSBtZSByZWR1bmRh
bnQuDQpXaGF0IGRvIHlvdSB0aGluaz8NCg0KPj4gK30NCj4+ICsNCj4+ICAgIHN0YXRpYyB2b2lk
DQo+PiAgICB4ZV9od19lcnJvcl9zb3VyY2VfaGFuZGxlcihzdHJ1Y3QgeGVfdGlsZSAqdGlsZSwg
Y29uc3QgZW51bSBoYXJkd2FyZV9lcnJvciBod19lcnIpDQo+PiAgICB7DQo+PiBAQCAtODQ5LDYg
Kzg4MCw4IEBAIHhlX2h3X2Vycm9yX3NvdXJjZV9oYW5kbGVyKHN0cnVjdCB4ZV90aWxlICp0aWxl
LCBjb25zdCBlbnVtIGhhcmR3YXJlX2Vycm9yIGh3X2VyDQo+PiAgICAJfQ0KPj4gICAgDQo+PiAg
ICAJeGVfbW1pb193cml0ZTMyKGd0LCBERVZfRVJSX1NUQVRfUkVHKGh3X2VyciksIGVycnNyYyk7
DQo+PiArDQo+PiArCWdlbmVyYXRlX25ldGxpbmtfZXZlbnQodGlsZV90b194ZSh0aWxlKSwgaHdf
ZXJyKTsNCj4+ICAgIHVubG9jazoNCj4+ICAgIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ0aWxl
X3RvX3hlKHRpbGUpLT5pcnEubG9jaywgZmxhZ3MpOw0KPj4gICAgfQ0KPg0KDQo=
