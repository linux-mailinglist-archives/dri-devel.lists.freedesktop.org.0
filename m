Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 079EA4B66E4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 10:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F256C89FD9;
	Tue, 15 Feb 2022 09:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2096.outbound.protection.outlook.com [40.107.215.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3AF89FD9;
 Tue, 15 Feb 2022 09:03:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPpPmNNC0M3vPAJnM3PxwLd3sSup3c704w/t6rAZG9tY1fy4ORCIl0rzGjO3jqBzM3jcwzHUFSyLBTvfXOQMI4r7Jm8JSRWbC3g1uISbR1RFdMUkww4ZK37+Fvpqv/7/51x0NGSAvPVw9BdYEt0Psw7OrY+4mxoHUxEEEL5zj+zf5UUu9S3h4J8VEd7PWSYKpdOvTlOSiYL/CiUy+7tvKaitzl22zZHQd+jEcrAemS6z0Xf09mmauziiilzdR+PCPm9WaY1jwLadrRFrym5RadF7rSKofjWIQhSlPNqiZsEurieyTFV7b0HhyeSKSg++K3YquRHnIfZNoUZYhzW2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGZ8vVYEdGEeFqa/5tb4dZHPb8IWs83sz1PdBYLJQ9M=;
 b=eWoc+VgYrgtPL2eSRSh0Nxu84taTPW2q2g8+501S/gENFvlFjTCRY4tg29JReY+01Kp1mpJJ13N7lUG3iuvhWK7rlhr8OuvPyfRZMWi/5ZqtgfuSl7vyA2pT8PSofU9FfVYJ1t+zTxIH4KthMTD0cZ2fqqOqpaRAMiXmw2CnMeKSHA2mZL4C8EM+2JofJlbbvI8s1YI/KdqIwf2PSKFdkkxHFi/EXD7Cg6XcQgr5ktP2DSwVujn9zUz0PBD0A44qvBan/IS5SjpTwwf/50wJ2rZrJSmznbG9HlGDF/5xzVmL52nLKmFon03pArFkYU9MhXf+Gu1brAjptpllpLxccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGZ8vVYEdGEeFqa/5tb4dZHPb8IWs83sz1PdBYLJQ9M=;
 b=Hl5XTdSAOM4j48RCB6XexixtVR3prG5OpcU6+u0kam9wdxe3BLwYvln4Nq4MLsUI8NhiiCCMxAZBINv4GTbGiEPA8fe850k3F2BFRT3tz4zqOUE3xPNhhcdUEI0yAIBeGPzaRBwWoVeAit8+fKYOrSh0EgXG9wUENlrse+waD3Y=
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by HK0PR06MB2482.apcprd06.prod.outlook.com (2603:1096:203:6c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 09:03:36 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 09:03:35 +0000
From: =?utf-8?B?546L5pOO?= <wangqing@vivo.com>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: RE: [PATCH V3 5/13] hid: use time_is_after_jiffies() instead of open
 coding it
Thread-Topic: [PATCH V3 5/13] hid: use time_is_after_jiffies() instead of open
 coding it
Thread-Index: AQHYIg9EnfxyFxjNWkWg98nJO/5UWayUTUWAgAABLl4=
Date: Tue, 15 Feb 2022 09:03:35 +0000
Message-ID: <SL2PR06MB30825E9679FD33F7F8E71075BD349@SL2PR06MB3082.apcprd06.prod.outlook.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
 <1644890154-64915-6-git-send-email-wangqing@vivo.com>
 <AFkA4QAPE2Ol9ndmGVhdHKpl.9.1644914882392.Hmail.wangqing@vivo.com.@PENBTy1od0pKSzV5ZVcrS192THBXVjl0M1RzRWRrMHhDTy1FVHhlSnNYTTJjMTE3SnpOd0BtYWlsLmdtYWlsLmNvbT4=>
In-Reply-To: <AFkA4QAPE2Ol9ndmGVhdHKpl.9.1644914882392.Hmail.wangqing@vivo.com.@PENBTy1od0pKSzV5ZVcrS192THBXVjl0M1RzRWRrMHhDTy1FVHhlSnNYTTJjMTE3SnpOd0BtYWlsLmdtYWlsLmNvbT4=>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: cadb0166-f93d-29f7-b7a3-f209084af4ce
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f91fe3ab-97fa-44c3-d80b-08d9f0620cae
x-ms-traffictypediagnostic: HK0PR06MB2482:EE_
x-microsoft-antispam-prvs: <HK0PR06MB2482905E315D173D3EB3B34CBD349@HK0PR06MB2482.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WHJdenequLjlJ752zdjZ57L24J0fYp70RJhGS6PyM5/LMoiNwh9lxJ9kxEXf/LUdeaKfHDBXETTClt7rLr/HAdF3HuY/yi5jbGex4RQf/9KWY9cxbvYSxORL9O/pau4Z9kGl40/NrJTCdp9YWJGEq07BlLzoVnkCQWNHSSPYlzhjrguv67pkq27f6TPcGGkqyaPnHpd8dVgEPI+0U1Xh1RPfL/KZ9HLmopk0kHHa2wl3QaqlnDqEDmLd1WkWyuCPYJAMK1lLNVgcfE8WthJaDZCq6z7DOql9XGWkQqUTsiinu53ljXbLALCPWgd855h7DcK8bopKfn1UoVlMHp+pEsCQReREZGanD1RjpjFyl4NN1ejwYU890Cg7Q54pBc6IxrmiKNKzzoGxA4pST/XZaSoMsannqj8YDA7bdRf486qAIEOeRb0KaSOYUwf5kHTjff8E09Bpk3+1Zh0xRrdassPDY5SAjUcyFFHuFVRA5dVGlND6rwYB6DmT+FpewRctdmkFls8xQcoo7jlSBcYPxYYqeUP9AeoAFSeX2v6XRPiJFnrcN5rTEV8GORU18O4i0RvcB7hoY/wYMn9Eu+uFCoK5W0zOAHaBwVuQJ9bzotdZCv9XnzEnBfZ9hRd0q0WtZNxndSVnChMZHnRhfF4FCW+pH0pt9EJqrWnVlyhPBbrzbGxKWITqDPtELRRREkSW87wBXVZ5mV0HVAIVyHbAQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(122000001)(64756008)(66946007)(7696005)(7406005)(55016003)(508600001)(6506007)(91956017)(5660300002)(9686003)(76116006)(66556008)(66446008)(83380400001)(7416002)(66476007)(86362001)(52536014)(71200400001)(8676002)(8936002)(2906002)(38100700002)(6916009)(85182001)(316002)(33656002)(38070700005)(54906003)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU50dlArcGdlOEc4OXFINDRpdDlGdTVVYkg4RlVtWkJoYUxZNW5IL3FNUVNP?=
 =?utf-8?B?cmVQb3c0WXU2UkpqeGhJdjNjYTV3RHJOTDFJQjRCSEt5MjdjWHVKV1V5TUVE?=
 =?utf-8?B?K1BjdzNCUzhxdnBCVkZYRE9KSnY5Q0ZzeGdwTTljeEpwb3NMNTZXRE0rZGRD?=
 =?utf-8?B?Ungxa2VUR3UyTUNSdHFueXlyMXFYemRkakhraFl0am5IaHAzd1VhQnlkbnA5?=
 =?utf-8?B?QnRlTy91R081QzVRd0ZEcTczcXpDbmpiL21vM3NWOXl1NVU1bDR2aFNWdlVS?=
 =?utf-8?B?UDBxV0VhbG5lenV2ZEpuT205K3ZOOUFVL2JKNlI0OUo5SzVuOHpONExEd2x1?=
 =?utf-8?B?NWRMNys4ZkxQQ005bXI1dEtESEZiUGs0dk5hOExpRXF6NkYyVkdxTFJWZ3J1?=
 =?utf-8?B?WXowS2pxdlYwNzU0YXl0bHVFWjhqZDVSS3psclgwdXljRnR0MDFRL2k5Z25C?=
 =?utf-8?B?dmJweGc5aFZSRTVORzBtNUc3Q1hMYnRXSXFxWnMwSndIVWpYRDJvelJPWGNS?=
 =?utf-8?B?cC9yTUVUVzFaODVocXRzNElIVnlsVUdPZmVySUh5Sk5TVVV0eG5oY2dVdi8x?=
 =?utf-8?B?THFuTVpWVWJuNkZ0dStjYmRDdWFWNWh3TVlFRDdveFByc0graWVpNklwRFl6?=
 =?utf-8?B?TGhuTnhRcHR3TmhPY0Yvem5aSFRwZHl5T3NCZnkwZndjTUI1cW9MVThwZ296?=
 =?utf-8?B?bmdoV0FqQ0ZZMVg2MkFGZGZFODdqQXhSU3c5TXRUZVg2VmpBOThaYytpeG5G?=
 =?utf-8?B?OUVFL3NXMXp2UjROV1lINUsyV1VmZDhlbjNFZU1jaFJ3bWJ4c3hISS9UMXZx?=
 =?utf-8?B?c1JyNWFPbWZ1YXNXQnpxbVJ6NVRGZzVrL0Jrb0dlblZOTE1HbENMNU44ZFN5?=
 =?utf-8?B?WUJMRDBHakVQUVAvMHQvQXdSR3YrcU9YYUJXR1RhR1dLV1hPUHQxS2pSVVdC?=
 =?utf-8?B?N0V5R0h5QTRvbWtSQTdRanF1YjlQekt2R1NPVTg1TGlYSCtDMW16QzM5OGdk?=
 =?utf-8?B?aHNJenoxbkp3V0NvS28yenV6cmUzU2hmdkVvQ3NRS1V2OTZHQUhKYk85dTBw?=
 =?utf-8?B?YXA5aFJwcGtLVEVnQ2x6TUNLVTJDdDZJRWlsZWF6RW1wV3cvSGZnQzUxbzdR?=
 =?utf-8?B?b3ZRSXpIcGozUExEWGVlYTYweFE0a3dPdGNlS0MrK2xjL1VTcW5CMU9ndDNw?=
 =?utf-8?B?QzlXNHdTVXVzRjEzWTJkTDZiMDZadjVCVmNkU3dMS0RKZlppeWJ6QjdOSCt0?=
 =?utf-8?B?K1kxRUJkYUlYczY3Q2g3UHJINk5RTG5sOVpFTURoRi9FSmxKL0FiYzBCTmx6?=
 =?utf-8?B?QlpIMlBOVXhzVDIvWnVxUXoxS1hnTzVadVg1ZUFhd2lFUThJQ056R0RCbHJj?=
 =?utf-8?B?ekNicElla0N0enFKWTFVeTJnTnVWMkR2OUxHRmFrTUdsQi9sbnBiSU4wZEJZ?=
 =?utf-8?B?YTZjKy93RWlMY1JZRzBwaHZubzJ1OTI0VUNKTk9ZNHR2TU95aTBuN3FhZ3Ux?=
 =?utf-8?B?Y21CZGNobHFUNE5LdlJleUduMGZxRHRORUp3SG5yalNWSkpDWjFzNWs3NHBx?=
 =?utf-8?B?Y3B0eU1jYUtCdkMxWVdncGZpemx4MnMrT20xd2I4ZzcwY3M3THJMQnpBZmQ3?=
 =?utf-8?B?dncwNDA4ZmVLdmR3ZWIxRHBlQWJ6Y25BcDlEWm9yMmQ3YWFCOU9lVmZaeEcz?=
 =?utf-8?B?cjBoSi91d1hoUUxBSVZ3cTNCRko2MGk5SVkwcDd4MWI2Z3V6ZDVwMkVNNHBn?=
 =?utf-8?B?MDJteGxwSDdEMEE4c2I5czNyd2FsNis3RCtTRnNIWHBxaHhyQnAxY29OWVZE?=
 =?utf-8?B?ODJMb3ZENXNZeHc5UXh5OFpTVmplSG0wbDllVHJHTFgzSExPcjEwRWR3WXNj?=
 =?utf-8?B?V2wxOEZZZjJ5VmlSanZSMWV4MnVNYnBEWGd3T3hTMmNhL2ErRldHSEx1bkQw?=
 =?utf-8?B?NXlPaXlPR0pHdVRjVk5LS01mdmZPaTBSNXBFMzVRTjNKWmhxQ2dXdEF3dFRC?=
 =?utf-8?B?UnY1ZXVWdng0YVhhTk9CYzJIb0tGNmExRGhzTC9zV1lXc0dBN0NyQUFaTHMv?=
 =?utf-8?B?K3JRSUQ5ZUhqNVBQUUtrTWR0RkFpaU5ybU9kUWhqc1dkOXVxOEpzdUJQMmRv?=
 =?utf-8?B?WVJJZEdDdnFDSHBjQmg0NWVXNXVzdHZhS01POWdaYnpYcmFtRmdwRzZvRllr?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91fe3ab-97fa-44c3-d80b-08d9f0620cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 09:03:35.8007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wH0npR8CluoPGqmP2HJeFXUqq67lGSukIp+nLBWT0mWvc3/bUKXy4rkOv2bNsLCCOZBvjtIrs5GYJoR0Ftwaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2482
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mike Snitzer <snitzer@redhat.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Alasdair Kergon <agk@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "open
 list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>, "Pan, 
 Xinhui" <Xinhui.Pan@amd.com>, lkml <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

wqAKPj5PbiBUdWUsIEZlYiAxNSwgMjAyMiBhdCAyOjU2IEFNIFFpbmcgV2FuZyA8d2FuZ3FpbmdA
dml2by5jb20+IHdyb3RlOgo+Pgo+PiBGcm9tOiBXYW5nIFFpbmcgPHdhbmdxaW5nQHZpdm8uY29t
Pgo+Pgo+PiBVc2UgdGhlIGhlbHBlciBmdW5jdGlvbiB0aW1lX2lzX3tiZWZvcmUsYWZ0ZXJ9X2pp
ZmZpZXMoKSB0byBpbXByb3ZlCj4+IGNvZGUgcmVhZGFiaWxpdHkuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFdhbmcgUWluZyA8d2FuZ3FpbmdAdml2by5jb20+Cj4+IEFja2VkLWJ5OiBTcmluaXZhcyBQ
YW5kcnV2YWRhIDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbT4KPgo+RldJVywg
dGhpcyBvbmUgaXMKPkFja2VkLWJ5OiBCZW5qYW1pbiBUaXNzb2lyZXMgPGJlbmphbWluLnRpc3Nv
aXJlc0ByZWRoYXQuY29tPgo+Cj5XYW5nLCBpcyB0aGVyZSBhbnkgcGxhbiB0byB0YWtlIHRoaXMg
c2VyaWVzIHRocm91Z2ggdGhlIHRyaXZpYWwgdHJlZQoKVGhhdCdzIHdoeSBJIGJhdGNoIHRoZW0g
aW4gYSBzZXJpZXMsIGJ1dCBJIGRvbid0IGtub3cgaG93IHRvIHRha2UgCnRoaXMgc2VyaWVzIHRo
cm91Z2ggdGhlIHRyaXZpYWwgdHJlZSBkaXJlY3RseS4KCkkgd291bGQgYXBwcmVjaWF0ZSBpZiB5
b3UgY291bGQgaGVscC4KClRoYW5rcywKV2FuZwoKPm9yIHNob3VsZCBlYWNoIG1haW50YWluZXIg
dGFrZSB0aGUgbWF0Y2hpbmcgcGF0Y2hlcz8KPgo+Q2hlZXJzLAo+QmVuamFtaW4KPgo+PiAtLS0K
Pj7CoCBkcml2ZXJzL2hpZC9pbnRlbC1pc2gtaGlkL2lwYy9pcGMuYyB8IDIgKy0KPj7CoCAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXBjL2lwYy5jIGIvZHJpdmVycy9oaWQvaW50
ZWwtaXNoLWhpZC9pcGMvaXBjLmMKPj4gaW5kZXggOGNjYjI0Ni4uMTVlMTQyMwo+PiAtLS0gYS9k
cml2ZXJzL2hpZC9pbnRlbC1pc2gtaGlkL2lwYy9pcGMuYwo+PiArKysgYi9kcml2ZXJzL2hpZC9p
bnRlbC1pc2gtaGlkL2lwYy9pcGMuYwo+PiBAQCAtNTc4LDcgKzU3OCw3IEBAIHN0YXRpYyB2b2lk
IF9pc2hfc3luY19md19jbG9jayhzdHJ1Y3QgaXNodHBfZGV2aWNlICpkZXYpCj4+wqDCoMKgwqDC
oMKgwqDCoCBzdGF0aWMgdW5zaWduZWQgbG9uZ8KgwqDCoCBwcmV2X3N5bmM7Cj4+wqDCoMKgwqDC
oMKgwqDCoCB1aW50NjRfdMKgwqDCoMKgwqDCoMKgIHVzZWM7Cj4+Cj4+IC3CoMKgwqDCoMKgwqAg
aWYgKHByZXZfc3luYyAmJiBqaWZmaWVzIC0gcHJldl9zeW5jIDwgMjAgKiBIWikKPj4gK8KgwqDC
oMKgwqDCoCBpZiAocHJldl9zeW5jICYmIHRpbWVfaXNfYWZ0ZXJfamlmZmllcyhwcmV2X3N5bmMg
KyAyMCAqIEhaKSkKPj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+
Cj4+wqDCoMKgwqDCoMKgwqDCoCBwcmV2X3N5bmMgPSBqaWZmaWVzOwo+PiAtLQo+PiAyLjcuNAo+
Pgo=
