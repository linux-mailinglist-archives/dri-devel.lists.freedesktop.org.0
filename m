Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBCD589F01
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 17:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65D69D295;
	Thu,  4 Aug 2022 15:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eastusazon11010004.outbound.protection.outlook.com [52.101.51.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9085312AB6B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 15:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3FY0ZKu7o9LybalRPXbhAT565zzlxNBRfgHzNyAvPnVVSCkP65OkgDf7Gb6GkH+JnbAeEUZrVPRUBv1ZDcbckzEJNEVnIvmWJthLJ+kfH+9EPYYLe7dcF346V2iNKmOp6lDY2P9ne9Gj0RT1b+51RNxeHWkn5qY9Q909v9rZM0JMSTmOo82VHYCwuNktgBHfp6NgTeLWJb8A1Rsnx3+ugnaN8nLdxduHczUtknlW4WC0hOs31TGXYGbAYbhVSXNTROu72NwQItXxGrT50OB/mc1V2I60Lqh7+5+moyo4Ic0PR91Lop5YDejn51VK44MljBdTSdL+5xaMHVTt32lJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/7LUD56mzNocyfHqMWn6umhSKqicGk/bea/sEkDOzU=;
 b=fIiCr7eq3J79CySwK85DKXvUpiH/JtoZB3zMQ/IlLzTzgMof0ff5FXWaBWF0HiTDg1vKxS+HDTKeISUtr6WEzptfO+s7D87ygVechcfS+4jlTqzIoy7LPlPOang72PWROD92Cv/eNWJyBgYiSvvRLhPfpdR3JK8BWItiA6AqKj1Exb2vz6taOARLU0eoHW+P0K2+oJzFctKCizLEFhnCmOp3B/lP7dbrlfQXQ/neUYuGhkF2DdXplzdHT/6Av45tp6Sg3wJyRHE0jfDpliUxTgsyg3h/+WOziGWcGoqmbmxdbYvyNM6bMW2B9/Mq+BMUKKE1mjcQ0uR74/gfLZpYMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/7LUD56mzNocyfHqMWn6umhSKqicGk/bea/sEkDOzU=;
 b=iIEiK7nCqD2IDFvFsz4dwqpFF1E4NNv8jPLucg2XnIFgh+znD3uTW2WUPE75ozHtNHLomHYOMXVka0/l+SmtrGVoVm2wpHiMZdp4SF9N6I6PU+VgMA5H0SRJHFlc8YPcQ78ujMiTW/cBEd17MXsnKDNIOyleT5n3S2v8LqgCOCY=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by DM6PR05MB4107.namprd05.prod.outlook.com (2603:10b6:5:8a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.10; Thu, 4 Aug
 2022 15:57:58 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02%3]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 15:57:58 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie"
 <airlied@linux.ie>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, "trix@redhat.com" <trix@redhat.com>,
 "cai.huoqing@linux.dev" <cai.huoqing@linux.dev>
Subject: Re: [PATCH] drm/vmwgfx: cleanup comments
Thread-Topic: [PATCH] drm/vmwgfx: cleanup comments
Thread-Index: AQHYpBxI6b1XVVpgZ0mAD+AUOrTWbq2e7bSA
Date: Thu, 4 Aug 2022 15:57:58 +0000
Message-ID: <541ceb5f87460873e65e454ae7432f1cf35cc4a3.camel@vmware.com>
References: <20220730135704.2889434-1-trix@redhat.com>
In-Reply-To: <20220730135704.2889434-1-trix@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9807b1a-d68c-42e1-d037-08da763219f5
x-ms-traffictypediagnostic: DM6PR05MB4107:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: futAcShIkw3DmqKpFEInAF9XahXyeBH2ojqWmthsM6Ejz613I9kusFWe59WdFadSHorhz3jVjxXhVAVUA+5goKods1tN9eyhVV0tgC79EcxNDExuXIoGkWCLMcjo+qQQSpKQi3xoABDlhkyrXM3/rPLd/+KR/XcADLxsyCwTqjSK+I30eKPpoAV5wqqT+5NrIf4EMOWLd7bBrxrey1MMFbmubVww2xKF6QNYJ8GQCopgGTy/BkZEkhS8GwxdWE1h0W8Y9PgLlcqHqmIMIpOB9eoapl1NgFYvBssdgoEfRBpR+/cfLQik5bm47abNgpI2xjDmm9J/aBKZyOIaXWcxtfguEPTEV2Pg5iqzXRIn4J7x8kKwTFY1WiKBRP/e8F2BJ8JAY9j79ojrKlMBR4Y3KOEeK9qOjoU55q/TG3xqKPP6qNXt2HtJJnqwBh0EefBbZnvdp50u2iPsU83+GXBM8fEbn5Fpunz2olIU8oz6K+gQnsV+6SavRYV78V2BuSyRUanuZ32UNff1S3Pp5VEICzvKkoXOqBkrRi6rWlNYejnv4J27H1wzVQETHY42AWJ+3qd8Fs5d/J/PWBc6oUmgkhY+BL2EqV4q/FrrnFYvP17PRTFYdnJ4/4bCfkXLw79eSZEClBH6wirVsgk4GjfUZoiXxsdONMb7iB0w2m5aLJn1cM9Xe9uLbsNFwcyFzg2+jXXAzxHiZct8PrSxIUlVqP6rNkLWe//lLsr0M9x6BwvIyL7whYSygnIh2N5QI+h03TRhqoLKH2JrkU97Tv3kq4uFTIEmfUiw493WYHLIbGJJrwhNVFLWoQLsZnE7ZeQ4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(5660300002)(4744005)(66556008)(64756008)(76116006)(91956017)(4326008)(66946007)(66446008)(186003)(8936002)(66476007)(86362001)(2906002)(38100700002)(122000001)(71200400001)(8676002)(6512007)(316002)(26005)(54906003)(2616005)(110136005)(6506007)(478600001)(6486002)(41300700001)(36756003)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1RZRmJXWnJrU3c0amgvTzEzc0orVVl3S1NGOFczSjVRSFRWbEd3bDVUTEFK?=
 =?utf-8?B?K0dXaUkxYzdtbUh4SDZWeGtlUGxueEljSElXcmd5UWNMRW8yTXVucVpaTmtG?=
 =?utf-8?B?MEZpclhlTndCWVNobTZTdlZEd3FoczVsamd2Y2JDV05yVElCTkZhd3pYTE1Z?=
 =?utf-8?B?WE9qSVpZUDBrT3o0RkpNcFFISjZlZGJocTNHNDl1YzFQblRHTzkraUlHcTFx?=
 =?utf-8?B?UnRNZk1JcTZGelJ3dVZad2ZJcDNIekNzRkZWMjNxbWdSdVhPUFFaYklvcVFs?=
 =?utf-8?B?YUlEcGRvTEFnL2x0WFlTSDJOMjRTbUt3SFQ1T0lpdi9rZjI5ZG9MamNEMURp?=
 =?utf-8?B?R2dJL1RTRFdpY3ZDOVpIeDVwekxGYTBZYTU2ZmlHcFZJdWR3bkRCcE52L2xm?=
 =?utf-8?B?WVJyb1RRUURxQW00NkEvY0JEeFJjOFc5WmMyS0VrclB3clp0ajBJZ2d1NkU2?=
 =?utf-8?B?aytBQnh5SHFJUEtuY1MxTXBQSzBzWXZYRWJubkE2RHRRY1NncmpCSitwVS90?=
 =?utf-8?B?b0Y1Wk96U2dZVjZYam1DWVRBK3FaeG5HZmNrcjM4NnpWZEFQWmwwNk0rVHdE?=
 =?utf-8?B?NUtnN1haY1JBU1hxcDcyVEJTUzlYL1B0WndnZ3R4V3g3YU9CZXRmUWtLQmds?=
 =?utf-8?B?WXBVbCsxdThwRDRaQllReVEvN0FhZ3c4KzdHYy9CSkFHTUVDa21uTkZaUEl3?=
 =?utf-8?B?NDhwOWNVekVVdlJXUjZkMGpHK05ObmcrQTJGeGJScFoxSStNbm5DQW5wMVND?=
 =?utf-8?B?RktwdFBHa0g3SHo0S2dISlBpTG8vSjVCM2JBQkhGVjBRS2pHZE9jaFNxRlFX?=
 =?utf-8?B?aWdDTDdVT1cvTFV6QVd0YU5XZDZMOFZzZnhZMjNuOU54ZFY2NVlmMXEva2Vo?=
 =?utf-8?B?WDIwYXRRSlovaVFpTFVvWCsvRjBHUEdtQXBlVkY5L3F6ZUh5Y2VHaXRCaGRM?=
 =?utf-8?B?UnllSVlZZ2FCVUNzRjlxZGRRaG5wSlh6UVhnQjdQK3F5RTBhN1YwelladVQ1?=
 =?utf-8?B?TlJGbkFjQUlkSEc2TmU1QWNUZDRjZVJDU3ZtcURlTmRIUUhNeDA0VjdJVFJ1?=
 =?utf-8?B?cXVPa3FBZjFINVI3cUVxZ2NneTQ5cndmVm50dFR4dFVUWUNGMUx6VjRGZ3FI?=
 =?utf-8?B?b2s2WHhLSEdrZlpLSDBWNm1iM3JBbW01cjh0UnphZndBZEdjblRFbDlFQzVl?=
 =?utf-8?B?Ylc3aDBPbkZXQnRNZGN4MktmN2JMTnB3ZWUwY2N6em5MSldueFlIbUIzenFo?=
 =?utf-8?B?YXJrUGx1cE15algwMUUrS3l3a3drWnhjQ0JDYnB0TXVqWlRQUHBVTDBQN202?=
 =?utf-8?B?QzV6R1FEOE1zb2RCYTI0S0dFWWc2WDhKbVA5ZGo3TkgvT1lOQnF2RWJub3J2?=
 =?utf-8?B?MHZOL09BMmlSTWpYdXZzQjhmYXZRM3pKL2dkbmlSNkFzekZ5b2VaRCtzK1dm?=
 =?utf-8?B?REZQY0gyWEVXQ3pQTTNoamNhbThNTWNSMVNhd05SR2RqMlQwU1FIcllwYThQ?=
 =?utf-8?B?UUtpNVE1S0YvMFEzRXdiZXFzK1FnRHMrTVVXMWRUSVhJUjc0cGJsQkxoczJ6?=
 =?utf-8?B?a0hZK2ptZzVYcDRnZDNlUnJVL2FjZGE3ekVML0ZvZzh1c1RxVktZNWhDejgw?=
 =?utf-8?B?ejRzcHNSTlV3aGN1TTZsYm9LdG1lMGI3SytkelpDbm5BYlRVdFMxQ0syYmN5?=
 =?utf-8?B?VGc5ck5ZaDVuNVJQSlJtQ0ljL3B2elRmdThxVEFrNHU5a2dseEdQUS9QRUg1?=
 =?utf-8?B?QkZFVmwvYnE0UzNTSERYMHZEdnNmc1FwNkN0U0MxRVh6bTlxVEdwQ1B5M2hy?=
 =?utf-8?B?OVpJWU1NU2ZNMWI2RGZNWEl1WGdxelgyMm5wemlmMC9CZkdabmZ0b3JRQXVT?=
 =?utf-8?B?TTJ0YzErR3NueHpIZTdQMXBYeFdUQ1owWHUwaERRZWZTS2poS1hyL25HY0Yw?=
 =?utf-8?B?Z0lqUTE2aUpDTEx2OWtXWkZLdTJpUzY1UE13aWZ2Wm9Qem9qQWMrR3JON2tD?=
 =?utf-8?B?TWVHdzRzWTNIOEFxK0I3TEdEMXM4L0k0bEFvRU5wMG1XcjlFOC8wZkIwYWJ0?=
 =?utf-8?B?bHgxOW5WQTVEdW9HcWxjVkwzQXg4ZFFvOGNEYVgyaFhvV0tjQTlQQ1p6Qjg1?=
 =?utf-8?Q?AU/VUoWOc+A/8GIAuYpiX12Zd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70AFFE65AD948149BEF5D3E6CFB74DF7@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9807b1a-d68c-42e1-d037-08da763219f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2022 15:57:58.1860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5aTUZGScCe3lgxaluZYkPiLM2w25t3XSnA/PEiYNhEh51UZn7/mXXht1Lm0OUxPtlZMNqrjSjjKuSnpSuyIwDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB4107
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIyLTA3LTMwIGF0IDA5OjU3IC0wNDAwLCBUb20gUml4IHdyb3RlOg0KPiBSZW1v
dmUgc2Vjb25kICdzaG91bGQnDQo+IA0KPiBTcGVsbGluZyByZXBsYWNlbWVudHMNCj4gYXFjdWly
ZSAgICAgLT4gYWNxdWlyZQ0KPiBhcHBsY2F0aW9ucyAtPiBhcHBsaWNhdGlvbnMNCj4gYXNzdW1p
bmdzICAgLT4gYXNzdW1lcw0KPiBiZWdpbmluZyAgICAtPiBiZWdpbm5pbmcNCj4gY29tbWl0ZWQg
ICAgLT4gY29tbWl0dGVkDQo+IGNvbnRvbCAgICAgIC0+IGNvbnRyb2wNCj4gaW5iZXR3ZWVuICAg
LT4gaW4gYmV0d2Vlbg0KPiByZXNvcmNlcyAgICAtPiByZXNvdXJjZXMNCj4gc3VjY2VzZnVsICAg
LT4gc3VjY2Vzc2Z1bA0KPiBzdWNjZXNzZnVsZSAtPiBzdWNjZXNzZnVsDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBUb20gUml4IDx0cml4QHJlZGhhdC5jb20+DQoNClRoYW5rcywgbG9va3MgZ29vZC4g
SSBwdXNoZWQgaXQgdGhyb3VnaCBkcm0tbWlzYy1uZXh0Lg0KDQp6DQo=
