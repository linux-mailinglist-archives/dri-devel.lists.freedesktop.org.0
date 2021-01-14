Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A74B42F625D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 14:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864996E364;
	Thu, 14 Jan 2021 13:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1036E332;
 Thu, 14 Jan 2021 13:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqKfwNt+uvKQKx4CkBVd2dzPV3rLnc57y8BUsonNUokOvUEIpPfaARNe3M0wwV84CgBFPvYXfJE2Kq99AYlTMaq1SnjAR93Y/3Tb3mWqtVAOn1Kbni3QT3iAimvLhaxObsBUxy/j2ZRXN31a7ydzWv9XxNcErHzopjnINRhieJIn4UCEGskjAxq5gdOEZBP/FoAa8/tNXNlBJo4V38+1domrJH+AmtbdvxpwcNYJKBf7y14A8T+mzyW76omA3y1f6Okqx475ItXIO0ankIl6Zz2xRiQry4u2aHhZvx6je4T00SxDDG8H1OSArTf1OSvldGkSaZDOJSSCRmpoqyTGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGmAOGrwePVgeM3RyN6OaivcGxDO6Dc9y6Pvp69tflU=;
 b=KZTGy0q1vEXf6hr05keO9vRKUv5Y+MPUnWTMYSW9zJYPoRMF7IpBappSHOk85cn37keFQ8daPNF+Kcaucd4zDHA4saikyHFW/ZAL9RzYGGP2/wgf/C1vtIeN22CepRaipw3+vdFK9cIT4aFFoMUdQXlMTEWDxu5fDaeI5Wba6b6gNtPHU1NQidcvaPkJadNlIHA630it9LC12gSgUmzJ7K3qL8QmzWkxc4zesQgCcj7GG/4lPVn3MhASMGE1vZs4IqXPkpEVXXFNzmvtcCGCSGq5rtQHLiYU29COhnaE7nOPqZfjKRKjI02OZ0yo062mD8v10wu3ibCVKSietZZywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGmAOGrwePVgeM3RyN6OaivcGxDO6Dc9y6Pvp69tflU=;
 b=iNISoM+mydXxdKHZGOlFIactuj4Rc89oLy2UDoJprMOgzUZLk9BhWV9g4UFEXFgoEOOEWiEyGMjULefJmzCdbXPTGFpy5DFZrbhMEZ4VkcvSW8rx8bcJeyax07XDGLPB2/HY0JLcAYlkI2e990862X4Dybv6HtDpO0eKbUnhxY4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 13:50:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 13:50:31 +0000
Subject: Re: [PATCH 06/10] drm: amd: amdgpu_dm.h: fix a wrong kernel-doc markup
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
References: <cover.1610610444.git.mchehab+huawei@kernel.org>
 <8e16f3aa553786cd193e49882ce5131e3769afb8.1610610444.git.mchehab+huawei@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <aa22e626-e461-48a1-e905-9c1e7cf204de@amd.com>
Date: Thu, 14 Jan 2021 14:50:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <8e16f3aa553786cd193e49882ce5131e3769afb8.1610610444.git.mchehab+huawei@kernel.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P189CA0004.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::9) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P189CA0004.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 13:50:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 177c3389-a9a0-440b-adf0-08d8b8935be5
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2353D75876C73C3F48737AAD83A80@BL0PR12MB2353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oYUx1lZLpn2HqdqcNLC66nzv8aXFBX5Vy7xB31z7GXU0q/lJaoduYV23DWqOPLT/IqVGbVVA9+ysQKG1mL+SILUNfgWOeTr3HtLv9q4aXOMrirKTqL9wWHS+PYAdnOTLvNfUf4wnt/A2Tptv8fBTf2vNBEJepCHjP/4KKkR4TKXKTVp6qH2ptW+ii1xiG1+Tr++huXr94rxu4e5V6vYzdjV0zafiO/ECeWLt0r+HK7N2TM6l3nuZ3ndlmC4Mu8WeWkdrcMwNAmFq2Yv/BA5cY2Vk9QvzSNOOAHPKz140tqno+sgwaUNMzZCSFu+1kvf5Wlxn9eyM+NrReshmpMptkwyT/QSR67zeB3BA0eKxcnU2VyNpXwFvkSM8UM5YmnewsNvxcswj8HDOjBoAU9UBayJzVvRmBZ5dI8fB1Mhn4WuB3O3tgGyKeIb0zKQcfad7TkOMqs0ZcQRtFy3FHZmV7Ks4ye3LVgBWVz9AZShLpR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(478600001)(110136005)(36756003)(54906003)(6486002)(52116002)(31686004)(316002)(8936002)(6666004)(31696002)(8676002)(2616005)(5660300002)(66946007)(16526019)(186003)(83380400001)(2906002)(66574015)(66476007)(4326008)(66556008)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?THJLTEg4L2tkRlBiaWlCdWlMZHR3eWNZaEpObU4yamp1bVh5UjdJOEQyVVpx?=
 =?utf-8?B?TzI1UHRxVEk4elp0dkNydjlvcVFwWkQ4OXdDc1RwSTI2K3hWSUYxdE9GS3Bz?=
 =?utf-8?B?d0JLZFpZRXE0ZE02Q3BEcW9hS2hCVHYvK2VZYVE1Y2NkQkJ1WGVRLy9FaWJR?=
 =?utf-8?B?U2RqQ2puR2h2dDM1Z05SWWZTNFJ6MVVncHZBUWVyRUM2Zm5KYTNQSlhEaTRL?=
 =?utf-8?B?cTNYMmZudzJwZW5XcU9mOU8yTmRhRiszNVVVM2FvRHpTWjVQaGZScmRJQkd1?=
 =?utf-8?B?NUtuTDlJWjhSTndYQUNWbCtQZXRwaWYvVUlGeTBzbmJHSFczWFVTV2NGSTFq?=
 =?utf-8?B?L2xKVGlXdjJkd0psc0Y2bE9DbzExRERIMzUrQ0NWdUNEc1I5MjJjRzhQM0RW?=
 =?utf-8?B?QmpYemdQQm8zSG9FVHVhOFN1TE1aR2doR1NWdG5hQXV1REhVTGxBSDk0VTVR?=
 =?utf-8?B?Nm54RWxYU2ZOV2MxeHFMK3RPKzN1V01jODhnWHFaK2RtSExid2huY2RXb2t6?=
 =?utf-8?B?dHlvaHI2U044UElXbCtpb2RiMVB0TU1zT3RFaTdVMk1xWEJMVDFoTTlZVVJq?=
 =?utf-8?B?QnR6MjRpRUtYV1JCcG5uZGVyZUNHVzNkdWlSdkVMV3JORWxiOUloWW1keFA5?=
 =?utf-8?B?aU5JV2RaR3VNRlk2QW5uRVBlR3NEVEZ0SjNzanp0cVlJQTlYUE93RXAxdWx2?=
 =?utf-8?B?SmtsM2VzKy9KUWdmSGdtRHlRTUhZYk9JVjVvRzdsUjY5c3hPaEExVTd3ZEE1?=
 =?utf-8?B?cTlFWllPalNCTjlDQkl2enViMEJULzN3M1JjQURhYlJxeWE2ODR4c3pRRTdS?=
 =?utf-8?B?bVlzcWVPY04wZGRpTXhHNGdpdnNvaFRWUlN0MEVkTGRuYTU1TU1PM3hkUzVF?=
 =?utf-8?B?NnFDT3pZTkhhZGlJeXpoWEltK1NoQ3dwUVNVaUFBVFE3TWVpQXNjdmcxdEVO?=
 =?utf-8?B?WWJSN0JPRWRIR2xCcG9qQUF3elJmQWloWEFadDVOUlAvT1VHK3ErZkVsRHJz?=
 =?utf-8?B?UjU2Uk93b0UxT2xvcndsbTV0VnJHdVdXWDBiZ2NiRGt0aTBjYUtCVjBFL3p4?=
 =?utf-8?B?eFQ4NEZnRXV4eGR2enU1b2VSOGt3WlBJSXRGTk9jYVVPR0pLbWZ2cExzU3lr?=
 =?utf-8?B?L2s1cVh4M3NGTlF3c0hjRGxNNFVTNjFYUVlZWnN5WlV0bk5KRTVYRHFjTzRH?=
 =?utf-8?B?RTlMVjkzcFdYNmc0TGtCM2lEV3dkOXd1QjlGQmdwY0E3NkVIRVlRdnpxYUdv?=
 =?utf-8?B?bTRQT2FCOHFXQUFEN3oyNWYxMnA1MEVjRC95Q0pZOWNVUU1Ua2hqamMrckhB?=
 =?utf-8?B?TEFkbFJRbkZFaDd2ODY2c2U2eGpJT1J4WUt2bi9WT0Voa2dFemM5a0tXVGVF?=
 =?utf-8?B?QWpoeWtjYitFZU9qNW1IbGlLdUVaVGNRMGt4blVxZVQ2c1pyY3h0MDRKOVJ4?=
 =?utf-8?Q?vQ3L8ROz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 13:50:31.1918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 177c3389-a9a0-440b-adf0-08d8b8935be5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQuF7sUHSR5ZaOT2I5xVNQxS8MgSC86FVZOtJk1Q9Dqwmw3SZ/rwtvxcHz7K8W3c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2353
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
Cc: Eryk Brol <eryk.brol@amd.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Leo Li <sunpeng.li@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDEuMjEgdW0gMDg6NTMgc2NocmllYiBNYXVybyBDYXJ2YWxobyBDaGVoYWI6Cj4gVGhl
cmUncyBhIG1pc3NpbmcgY29sb24sIGNhdXNpbmcgdGhlIG1hcmt1cCB0byBiZSBpZ25vcmVkLAo+
IHNvbHZpbmcgdGhvc2Ugd2FybmluZ3M6Cj4KPiAJLi4vZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaDozNDA6IHdhcm5pbmc6IEluY29ycmVjdCB1c2Ugb2Yg
a2VybmVsLWRvYyBmb3JtYXQ6ICAgICAgICAgICogQGFjdGl2ZV92YmxhbmtfaXJxX2NvdW50Cj4g
CS4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmg6Mzc5
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdhY3RpdmVfdmJsYW5rX2ly
cV9jb3VudCcgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlcicKPgo+IFNp
Z25lZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitodWF3ZWlAa2VybmVs
Lm9yZz4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uaCB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5oCj4gaW5kZXggZjA4NGUyZmM5NTY5Li41ZWUxYjc2Njg4NGUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
aAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmgKPiBAQCAtMzM3LDcgKzMzNyw3IEBAIHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyIHsK
PiAgIAljb25zdCBzdHJ1Y3QgZ3B1X2luZm9fc29jX2JvdW5kaW5nX2JveF92MV8wICpzb2NfYm91
bmRpbmdfYm94Owo+ICAgCj4gICAJLyoqCj4gLQkgKiBAYWN0aXZlX3ZibGFua19pcnFfY291bnQK
PiArCSAqIEBhY3RpdmVfdmJsYW5rX2lycV9jb3VudDoKPiAgIAkgKgo+ICAgCSAqIG51bWJlciBv
ZiBjdXJyZW50bHkgYWN0aXZlIHZibGFuayBpcnFzCj4gICAJICovCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
