Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E5626BD97
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 09:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6976E2C0;
	Wed, 16 Sep 2020 07:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680056.outbound.protection.outlook.com [40.107.68.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018686E2C0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 07:01:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETpzGBWSTM0hk/jNcuPh+5eDnUZTYSfcVfPOoziBcwbHqVUudvEc1KkD2Um+nPK17jswCcxKrVyQ3Lk0v94Q91gBiwa4v/ymCnqwupMkJjmpJttpFJ3wag8U6s5UwK3J17Sa8u9W7Dv3+W+SaYgPx59OYdDYMo3FvhGTqT5xRDD2Pduiang28wtrG5ytQ0JmPk1CONbJOyrd3G2E1lgdKVuVgA9kd5kEnVZtml89xEq4nwLON8esZdxV7sOSh2NWPVF1ssPSBkXv6hHIEiN54JZ1MUvg7FmfqvN+thegaiwppI+2o24rA2GNC/YZVcz/B6H1Ncj+dgfUz1n3xx+HGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABUeVeVYVB3Gb0r19dpBnI05Xw563PtyGke6HjdjIBQ=;
 b=flLDg/uKYc82x4oGs+TVRy0k56+sLV/oXcJzSnysieOMcqaWx1IQd4WCAnGTx+mHOhWw59LkTfISFjpWuJhusei9GUzfZ1Pu+gyTWwrRaMdmR5/aokCoV4UVlLD+9rweEtYM8SwCCbGKfOlK9vDCap5vAjxGYwq+3GxkM/i0TgDLHv1u7AkOoX36cyndfQbaJKIdHBV+K/WVcpMRm3wh1KKZextUN/dR/Zx994VUjbjTdiFXLz+uUn0WGl7FsWQZ18+XNmQMt6vazjCIjejxUV+UQnwo7gh0pLn74KSul5czAlbmVXZ8DgNQ/RHsA1tPXvl8vFtqDjVVZOyCgleJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABUeVeVYVB3Gb0r19dpBnI05Xw563PtyGke6HjdjIBQ=;
 b=0PGdIyu6XChZiOE1X1/qaOkLKksXgnIgqtZYnyUoMhiQ0nw/rxE0FiPgrs6otFGW98KLixghYP3+CK62qC10ueSbNENq0lYarO7LaIH95ia7gk/uppj+J5eHzOySSrfvQl8mJbSvlOhi+WfEMV68OIxT3pHXn2Qo1cG14Kn30UA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 07:01:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 07:01:47 +0000
Subject: Re: some half-baked ttm ideas
To: Dave Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <CAPM=9txcrHC77Quj6ufUHn0FD1-7b4YKO2MWFZGwJy8Tmj1i7g@mail.gmail.com>
 <6b59373e-c4e0-76b5-ffa7-d4bb954a1ffb@gmail.com>
 <CAPM=9tzXsGqnbkUH30vUHd7zyenCNj=ikVjx6P1qWq9dx0jiEg@mail.gmail.com>
 <CAPM=9tySxEnV+1q=hyu4c5tSX35ZJr6TBKwfnUkQZbuw=XkrLA@mail.gmail.com>
 <85097575-b713-095d-7c09-9e4d02f5fbda@shipmail.org>
 <CAPM=9txarasvU0stgm5WZUgJWBCPSnM2hN8CNazqOd7ugHEzaQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <99bae743-779f-3a3b-00c5-0e281535719d@amd.com>
Date: Wed, 16 Sep 2020 09:01:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9txarasvU0stgm5WZUgJWBCPSnM2hN8CNazqOd7ugHEzaQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0101CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0043.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Wed, 16 Sep 2020 07:01:46 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e2d699ab-e583-41da-0048-08d85a0e60a8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4047:
X-Microsoft-Antispam-PRVS: <MN2PR12MB404760E5A4CEDFDA8B4F1BAF83210@MN2PR12MB4047.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A4V45kHxuYIadFX+kkpKMvH1mdQRjOndh1vTN5JX5Fm6sw6ZM3vp3kOrSKrgvLqLP2+orIneD0g9840of6r9uCfNVrTvp6MEWN0eK8RDVVkhzDVmYb+fMHBj9Ut2ziflV81f//G0V3vmFvC3xZXGBiW2vzsv6xZX9LbTE+aSCbs2f5TrL9pRKwu5XrUVaJlugGT7ZsgzIU25xhKd5DcQPwWib6Gj0U+2uw3dLcHFBNU92YjnXteszDD9nklWhIrWHEN2MWUKn2r08dNFhOVuEeoRZGgjtZWhbGVcvO5zgYL9arA0dfkt6/ysAzdVbXcvsEJOuR0X3VYm+g3PGd+g7f511pT73ySPSs8EeBMqxl13nFTOaP/eDhGRIgYUebXZDrThlAClNRqZ5VpVUpfmjaa/HL+tVx2bYizJtRQ1xgCaQMtnhbYIYRp5+fOdSzTo+N6TNHFHWlXmDNLJjerTSP6aMchIBr/sAzu8UmSvEuhcpnguVgfnh+3RP+IRoNmH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(2906002)(83380400001)(3480700007)(31686004)(36756003)(4326008)(6486002)(31696002)(8936002)(86362001)(8676002)(6666004)(478600001)(45080400002)(110136005)(66574015)(66476007)(66556008)(66946007)(966005)(2616005)(53546011)(5660300002)(16526019)(186003)(316002)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: GfSevt5IRhbygFF8bvXJWhQscHOWXUwU7mCejo0/IOTNVj6Y77bQ1yQ29NHVHVn7gNWyWhLkQRlJ9s0N2DuNlTTPi8w1KgeRCAvuCjmyGcxZlitnRMMbpXy7nccFDKA7jVHpDizVqVl4LkrmOp89dMIRGUzE+k/g5thgkYjfWdr6c01gTNd6NHd5K4ptdK8O1m+HyOAHevQjVEok1VeRP/qft8gdLoJHEDr/SlWlWvPdyBvMRexn9B2dIv+3SeQ95qnK7jvd8uybV+Pbsj1rkczc5F7OKV3HXlwGmcJ3ukBjrvCGwS8gGsreVm2Z7ytyHp6deLs3Xyvg6KKeoyopJI2MhzNRUO3wyuhTeilfAERPUDS+Kv8QVV3h+lCwslNEgrBDSxyWKaaDse8kVb7EXFKpFZj+d7rW9YqZ4Vj0lP4xPU0HicK/WxHIC3LiAQ04PdnxL//1zWAYmN6o5msE7H4IJ4+G2coMIaIy/yBsgXz2vo3KTNcaaBw0witZUAaERyr3372B+R+G9PDQVlexOPsSNqyFr05/xo+GOTV9XDnEmii5P2KpUL7CAddu9zyUJOR+ePH6QYy72Mb9Dz/H6BTlky5voXO5CNKzboV/4kGZX3ZnA7HQM1+abCKFbWeNzhaAI88/qlgx2AY2uY1wASLLGABAyUGvRM+SYHq1D3bhWxchK629XK8/mhb5tJB/M5bGYgb106uu2swlxb9O1w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d699ab-e583-41da-0048-08d85a0e60a8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 07:01:47.5277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7q8FMY8uJ+5aiug85Pc4/mwPrwyWtZWW7n9GTWlLsyOkAtItEeFINjiYhS2zHaM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDkuMjAgdW0gMDg6NTYgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBXZWQsIDE2IFNl
cCAyMDIwIGF0IDE2OjQ0LCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpCj4gPHRob21hc19vc0Bz
aGlwbWFpbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiA5LzE2LzIwIDY6MjggQU0sIERhdmUgQWlybGll
IHdyb3RlOgo+Pj4gT24gV2VkLCAxNiBTZXAgMjAyMCBhdCAxNDoxOSwgRGF2ZSBBaXJsaWUgPGFp
cmxpZWRAZ21haWwuY29tPiB3cm90ZToKPj4+PiBPbiBXZWQsIDE2IFNlcCAyMDIwIGF0IDAwOjEy
LCBDaHJpc3RpYW4gS8O2bmlnCj4+Pj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29t
PiB3cm90ZToKPj4+Pj4gSGkgRGF2ZSwKPj4+Pj4KPj4+Pj4gSSB0aGluayB3ZSBzaG91bGQganVz
dCBjb21wbGV0ZWx5IG51a2UgdHRtX3R0X2JpbmQoKSBhbmQgdHRtX3R0X3VuYmluZCgpCj4+Pj4+
IGFuZCBhbGwgb2YgdGhhdC4KPj4+Pj4KPj4+Pj4gRHJpdmVycyBjYW4gdG8gdGhpcyBmcm9tIHRo
ZWlyIG1vdmVfbm90aWZ5KCkgY2FsbGJhY2sgbm93IGluc3RlYWQuCj4+Pj4gR29vZCBwbGFuLCBJ
J3ZlIHB1dCBhIGJ1bmNoIG9mIHJld29yayBpbnRvIHRoZSBzYW1lIGJyYW5jaCwKPj4+Pgo+Pj4+
IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZhaXJsaWVkJTJGbGludXglMkZjb21taXRzJTJGdHRtLWhh
bGYtYmFrZWQtaWRlYXMmYW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQu
Y29tJTdDYzhiY2ViZmM0YjkwNGZmMTczOTEwOGQ4NWEwZGIyYTclN0MzZGQ4OTYxZmU0ODg0ZTYw
OGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MzU4MzYyMTU5NDc5OTIzJmFtcDtzZGF0YT12
TVByV3RpUDZxZFA1Qm9UZHFObFJYR3NZUUo5YVBtVnZWa0ZveVdGSldNJTNEJmFtcDtyZXNlcnZl
ZD0wCj4+Pj4KPj4+PiBidXQgSSd2ZSBmcmllZCBteSBicmFpbiBhIGJpdCwgSSdtIGhhdmluZyB0
cm91YmxlIHJlY29uY2lsaW5nIG1vdmUKPj4+PiBub3RpZnkgYW5kIHVuYmluZGluZyBpbiB0aGUg
cmlnaHQgcGxhY2VzLCBJIGZlZWwgbGlrZSBJJ20gY2lyY2xpbmcKPj4+PiBhcm91bmQgdGhlIGFu
c3dlciBidXQgaGF2ZW4ndCBoaXQgaXQgeWV0Lgo+Pj4gZHJtL3R0bTogYWRkIHVuYmluZCB0byBt
b3ZlIG5vdGlmeSBwYXRocy4KPj4+Cj4+PiBJbiB0aGF0IHRyZWUgaXMgaW5jb3JyZWN0IGFuZCBJ
IHRoaW5rIHdoZXJlIHRoaW5ncyBmYWxsIGFwYXJ0LCBzaW5jZQo+Pj4gaWYgd2UgYXJlIG1vdmlu
ZyBUVE0gdG8gVlJBTSB0aGF0IHdpbGwgdW5iaW5kIHRoZSBUVE0gb2JqZWN0IGZyb20gdGhlCj4+
PiBHVFQgYXQgbW92ZSBub3RpZnkgdGltZSBiZWZvcmUgdGhlIG1vdmUgaGFzIGV4ZWN1dGVkLgo+
Pj4KPj4+IEknbSBmZWVsaW5nIGEgbW92ZV9jb21wbGV0ZV9ub3RpZnkgbWlnaHQgYmUgYW4gaWRl
YSwgYnV0IEknbSB3b25kZXJpbmcKPj4+IGlmIGl0J3MgYSBiYWQgaWRlYS4KPj4+Cj4+PiBEYXZl
Lgo+PiBJIGRvbid0IGtub3cgaWYgdGhpcyBjb21wbGljYXRlcyB0aGluZ3MgbW9yZSwgYnV0IG1v
dmVfbm90aWZ5IHdhcwo+PiBvcmlnaW5hbGx5IG9ubHkgdGhvdWdodCB0byBiZSBhbiBpbnZhbGlk
YXRpb24gY2FsbGJhY2ssIGFuZCB3YXMgbmV2ZXIKPj4gaW50ZW5kZWQgdG8gZHJpdmUgYW55IG90
aGVyIGFjdGlvbnMgaW4gdGhlIGRyaXZlciB0aGFuIHRvIGludmFsaWRhdGUKPj4gdmFyaW91cyBH
UFUgYmluZGluZ3MuCj4+Cj4+IFRoZSBpZGVhIHdhcyB0aGF0IFRUTSBzaG91bGQgcmVhbGx5IG5l
dmVyIHNldCB1cCBhbnkgR1BVIGJpbmRpbmdzLCBidXQKPj4ganVzdCBwcm92aWRlIG1lbW9yeSB3
aGVyZSBpdCB3YXMgZ3B1LWJpbmRhYmxlIGFuZCBtYWtlIHN1cmUgaXQgd2FzCj4+IENQVS1tYXBw
YWJsZSB3aGVyZSBuZWVkZWQuIFRoZSAiZXhjZXB0aW9uIiB3YXMgbWFwcGFibGUgQUdQLXR5cGUK
Pj4gZ3B1LWJpbmRpbmdzLCBmb3IgdGhlIHNpbXBsZSByZWFzb24gdGhhdCB0aGV5IHdlcmUgbmVl
ZGVkIHRvIHByb3ZpZGUKPj4gQ1BVLW1hcHBpbmdzIG9uIHN5c3RlbXMgd2hlcmUgeW91IGNvdWxk
bid0IG1hcCB0aGUgcGFnZXMgZGlyZWN0bHkuIEJ1dAo+PiBzaW5jZSB3ZSBzZXQgdXAgYSBHUFUg
bWFwIG9uIHRoZXNlIHN5c3RlbXMgYW55d2F5LCBtYW55IChtb3N0KSBkcml2ZXJzCj4+IGp1c3Qg
bWFkZSB1c2Ugb2YgdGhhdCwgYnV0IG90aGVycyB0b29rIHRoZSBzdGVwIGZ1cnRoZXIgaW5zaXN0
aW5nIG9uCj4+IHVzaW5nIG1vdmVfbm90aWZ5KCkgdG8gc2V0IHVwIEdQVSBiaW5kaW5ncywgd2hp
Y2ggd2FzIG5ldmVyIGludGVuZGVkIGFuZAo+PiBhZGRzIGVycm9yIHBhdGhzIGluIHRoZSBUVE0g
bW92ZSBjb2RlIHRoYXQgYXJlIHByZXR0eSBoYXJkIHRvIGZvbGxvdy4KPj4KPj4gU28gaWYgd2Un
cmUgY2hhbmdpbmcgdGhpbmdzIGhlcmUsICBJJ2Qgdm90ZSBmb3IgdGhlIGZvbGxvd2luZzoKPj4K
Pj4gKiBEcml2ZXIgY2FsbHMgdHRtX2JvX3ZhbGlkYXRlIHRvIHB1dCBtZW1vcnkgd2hlcmUgaXQg
aXMgY3B1LW1hcHBhYmxlCj4+IGFuZCBncHUtYmluZGFibGUKPj4gKiBPbiBzdWNjZXNzZnVsIHZh
bGlkYXRlLCBkcml2ZXIgc2V0cyB1cCBHUFUgYmluZGluZ3MgaXRzZWxmLgo+Pgo+PiAqIG1vdmVf
bm90aWZ5IG9ubHkgaW52YWxpZGF0ZXMgR1BVIGJpbmRpbmdzIGFuZCBzaG91bGQgcmVhbGx5IHJl
dHVybiBhIHZvaWQuCj4+Cj4+IFNvIHRoYXQgYmluZCgpIGFuZCB1bmJpbmQoKSBzdHVmZiBpcyBy
ZWFsbHkgb25seSBuZWVkZWQgZm9yIGNwdS1tYXAKPj4gdGhyb3VnaCBhcGVydHVyZS4gSWYgd2Ug
ZGl0Y2ggdGhhdCwgdGhlbiB3ZSBuZWVkIHRvIHJlLWRlZmluZSB0aGUgdGFzawo+PiBvZiBUVE0g
dG8gcHJvdmlkZSBtZW1vcnkgaW4gYSBjcHUtbWFwcGFibGUgbG9jYXRpb24gYW5kIGZpZ3VyZSBo
b3cKPj4gZHJpdmVycyB0aGF0IHJlcXVpcmUgY3B1LW1hcC10aHJvdWdoLWFwZXJ0dXJlIHNob3Vs
ZCBoYW5kbGUgdGhpcywgc2luY2UKPj4gdGhleSBjYW4ndCB1c2UgdGhlIFRUTSBmYXVsdCBoYW5k
bGVyIGZvciB0aGF0IG1lbW9yeSBhbnltb3JlLiBUaGUgc2FtZQo+PiBob2xkcyBmb3IgZHJpdmVy
cyB0aGF0IHdhbnQgdG8gbWFuYWdlIHRoZWlyIHRyYW5zbGF0aW9uIHRhYmxlCj4+IHRoZW1zZWx2
ZXMsIGFuZCBuZWVkcyBzb21lIGNwdS1tYXBwaW5nIG9wZXJhdGlvbnMgdG8gZ28gdGhyb3VnaCB0
aGUKPj4gYXBlcnR1cmUgcmF0aGVyIHRoYW4gdG8gdGhlIHBhZ2VzIGRpcmVjdGx5Lgo+Pgo+PiBJ
ZiB0aGUgZHJpdmVyIGhhcyBubyBzcGVjaWFsIGNwdS1tYXBwaW5nIHJlcXVpcmVtZW50cywgaXQg
c2hvdWxkIGJlCj4+IHBlcmZlY3RseSBsZWdhbCBmb3IgaXQgdG8gbm90IHByb3ZpZGUgYW55IGJp
bmQoKSBvciB1bmJpbmQoKSBmdW5jdGlvbmFsaXR5Lgo+IEkgdGhpbmsgdGhhdCBpcyBjbG9zZSB0
byB3aGVyZSB3ZSB3YW50IHRvIGVuZCB1cCwgaXQncyBqdXN0Cj4gdHJhbnNpdGlvbmluZyB0aHJv
dWdoIGEgZmV3IGludGVybWVkaWF0ZSBzdGFnZXMgdG8gZ2V0IHRvIGl0Lgo+Cj4gSSB0aGluayBJ
IGNhbiBsaWtlbHkgcHV0IHRoZSBiaW5kcyBpbnRvIHRoZSBkcml2ZXIgbW92ZSBjYWxsYmFjawo+
IGluc3RlYWQgb2YgdGhlIG1vdmVfbm90aWZ5IG9uY2UgSSByZW9yZyB0aGluZ3MgYSBiaXQgbW9y
ZSwgYW5kIHRoZW4KPiBtYXliZSB3ZSBjb3VsZCBzcGxpdCB0aGUgbW92ZSBvdXQgdG8gaGFwcGVu
IHBvc3QgdmFsaWRhdGUuCj4KPiBJJ20ganVzdCB3b3JyaWVkIGFib3V0IGludGVybWVkaWF0ZSBz
dGF0ZSBoZXJlLCBzbyBpZiB3ZSB2YWxpZGF0ZQo+IHNvbWV0aGluZyBpbnRvIFZSQU0gd2Ugc3Rp
bGwgaGF2ZSBhY2Nlc3MgdG8gdGhlIENQVSBzaWRlIGJhY2tpbmcgc3RvcmUKPiB3aGlsZSBpdCdz
IG1vdmVkIGluLCBhbmQgdmljZS12ZXJzYS4KClllcyBleGFjdGx5LgoKRm9yIHRoZSBpbnRlcm1l
ZGlhdGUgc3RlcCBJIHRoaW5rIHRoZSBiZXN0IHdvdWxkIGJlIHRvIG1hbnVhbGx5IGJpbmQgdGhl
IApUVCBvYmplY3QgdG8gdGhlIEdBUlQgYWZ0ZXIgY2FsbGluZyB0dG1fYm9fdmFsaWRhdGUoKSBs
aWtlIFRob21hcyBzdWdnZXN0ZWQuCgpVbmJpbmRpbmcgY2FuIHRoZW4gaGFwcGVuIGF0IHR3byBs
b2NhdGlvbnM6CjEuIEluIG1vdmVfbm90aWZ5KCkgZm9yIHRoZSBjYXNlIEdUVC0+U1lTVEVNLgoy
LiBXaGVuIHRoZSBUVCBvYmplY3QgaXMgZGVzdHJveWVkLgoKQm90aCBvZiB0aG9zZSBzaG91bGQg
YmUgaW5zaWRlIHRoZSBkcml2ZXIgYW5kIG5vdCBUVE0uCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+
Cj4gRGF2ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
