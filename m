Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743192CB77C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D4F6EA21;
	Wed,  2 Dec 2020 08:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DEB6EA12;
 Wed,  2 Dec 2020 08:43:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxVSnINdCmIEtBAPut7KLWBAqF9XS2jULgwRDvMb4AU6wzm2KJgXLcUlFoOuzQ9vGSHNhlaEyq4eBgO9kzf7jn5MI/dxYT9MMxusBV6RWTzao0qMEfQTnWLZqcgdgD30tWD3Rfu5p12yQAlR6+EbVA7HlrJCwgOR7n8QMRNRWKafG7arSc5IeFHKg37vSVhgyHmzud89Z92LI1SMOoLiLd6CXqB7iacCjOF1Kzh7WRcua/oWUIOgyZ0LjEN5Bn7rzEnrSBucPYSeAoZyudVSfmjs0I5g3hcX8X4lKAaXcUQkppjpgiyLeHJR0e8M+LvpD7CCczUQZ0pPqD7RH/68RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WIyMTZM1ewzCgxgFEZFuYQIMMnWfmkr0D0R6nbUBMY=;
 b=QGBLKN/Gdz5Vzjamx1oC1X42+4xcyPkXkBdIowQqf3RLvaOjquozR97ClZVuwYlmcLNbgsNWi/+qN6AJL1P5At6nlgYRfIUhKNH4Lc8mT7FFF+8dkly1beWdKub9fzDRseTHlGVXUPRT9SwqqnTD84o2ZdXov9zdC5e6mS0Y2LNWKYvSNSShAxJUue+IF9eBN33AZGoYZucAktwowXsrqJWVPIlqDTO1BxY0yYZRko+GmRoxNewlq4QkaZIiuRZDU2hjjfYXE79yBo0Q9SXO5hVaWcqpVlAWFOJcxF45thQPY07dfgfNyf5OWkf8CyZK7M88oHu0kZpCr/s3/vEqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WIyMTZM1ewzCgxgFEZFuYQIMMnWfmkr0D0R6nbUBMY=;
 b=QewSVakW3nIzG49UcZKpxh8E31FjydbRHllBnmpxc7vNMbjeTiLa6TlDNAx9odK5B5bSG/HTY5T7tEajI5242PO9YKtLy3pyz6019PyR/zyg0greQ1z3OX2khyJq1fKaqc+wLJ8+6Ss1yq31PNKARxTxK3n4CtweG3MU3PZ76XQ=
Authentication-Results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4947.namprd12.prod.outlook.com (2603:10b6:208:17d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Wed, 2 Dec
 2020 08:43:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 08:43:46 +0000
Subject: Re: [PATCH v2 01/20] drm/amdgpu: Fix trailing whitespaces
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-2-tzimmermann@suse.de>
 <d79aa7c0-9b0b-4f1b-c4e5-54f53a8d2931@amd.com>
 <63150504-fda0-48fd-9ecd-fb19ea0ae9d7@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <997ad04d-2acb-1dfb-0733-78f79a45b453@amd.com>
Date: Wed, 2 Dec 2020 09:43:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <63150504-fda0-48fd-9ecd-fb19ea0ae9d7@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P192CA0016.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P192CA0016.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 08:43:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4792d28e-f0f4-4872-f002-08d8969e61ff
X-MS-TrafficTypeDiagnostic: BL0PR12MB4947:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49476FDA4FCC91E6665C3E8C83F30@BL0PR12MB4947.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ke5mQxU4e4eUfabxn6T7g2BpYcrZ58eeAjbBWXkygFsdt3zEZIxyl/FIBGy4IKpJbobOhtMsSSN+hD3J7k2uFnrZR0RkBwj4H/s1c+Ea441mMJj0UWjv3/6h2r/z0+k6ztnMlu0tRJrtlZjegXLL0L5QCNj2tVqzpkTAM1RZhVk1Xc2Y5232zEIMuOOSXme+9Mp3ICNwrAnBiesKlFq3gb2BwljRgTUQhwmGagMmq9qygYLn6Y2KIOBn3JbAJGQnVgfI76XaPU2SHzj0S4KJDEnTA3MUor1d2cNatPRJUnCcrA6ak2SEXBfYh5n2GfJilTV6tMV23InvGs9BJ/Q6BH5Jx2yxGa15WP1WCLLRCYLmOhl8rrFd2TXB0KLVog3cIxjFV0XeCxW0ZIrPpcGP6hytd3KgqucrPVmC+AHAtxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(54906003)(86362001)(66476007)(66946007)(8936002)(2906002)(2616005)(31696002)(36756003)(5660300002)(83380400001)(316002)(4326008)(66556008)(8676002)(6486002)(6666004)(66574015)(16526019)(31686004)(7416002)(478600001)(186003)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?am02bUNpRDdjd3VnbXVITFkyZVhEblBFZUxadXYwcTFnZnRIY1B4MFhDV25o?=
 =?utf-8?B?Y0c1QWxRRTdzdVVKVjdHZEhEYThpSUkwVWFZb2NtREpLdXV0cWxxRlpBaU9H?=
 =?utf-8?B?aDE1REFWS0sxbVNYd0F3elI2eGlTZllmbmRWaGE2K1RjYllFZlBHdHl3aXVC?=
 =?utf-8?B?T04zOTRjN2VHeTkzdEg3Si8xVnRMS2Y0MC9yNmNGM1RMNDVZN3JKK3dkdGpn?=
 =?utf-8?B?UmI5TFVxQW1UZWM1Rzh4VzJVa0l1anVLcFpOOXBtMUVCQkN2aDJYdmsyR1po?=
 =?utf-8?B?eEtjOUpXSTN5RzdpUC8wcm1MYXA4eHNMaGVZbnpqdHI5R3IvTndmQkQ4aVEx?=
 =?utf-8?B?MFk1TG5tY21vajBUV1RWL3VBUEM5dXc0Uzk4L3JYTEFQMllEdUVjQnlKVzRl?=
 =?utf-8?B?KzVKd2E5L1hxYnFVYk9wWWdiekVIREZ6TFBkSktWTDh1NU1JbTFLT1RlejNk?=
 =?utf-8?B?ZGkrTG1PS3JsNkVONjdzbHR1eThydWMrcmQ1U0MvZXoxVjZKL050d2dyNVFV?=
 =?utf-8?B?c3dTN0M3SU5YdjJ4QXE3cGxJRmc5Yk94QkJFelBHSloxVFluYXZsSklxWE8v?=
 =?utf-8?B?RXFlU2NPSGNZblUwZ3lnTy8ydnBjSXB2SXRhcTFxM3RHWlkrZ3VzYTk4K0tY?=
 =?utf-8?B?cGZHMU1jcThBaHBXOXBzNkJqMDU3UnpqQ1JySldhaHhkVnFLM1k1Q2hRaFRj?=
 =?utf-8?B?N05XUGtmYnZBbi9PRGdzT1pGdzRJZ29yQ3ZrTW5CZzlzVC9XdFNtbjNnaWtm?=
 =?utf-8?B?TmpLbHlXZ0hlbG1HTkpMZTRZdHB3RS9jKytrL25NcFJWSzQ4VkNTVWZBZEw0?=
 =?utf-8?B?LzRpQTFCVWc3MUk0b21KU3lqTlVKK0VPN2FNRGlWLzRDemVGcFlhMmZmdWZ2?=
 =?utf-8?B?aFFieGhsc1pEOGxuZWNVZ2hRSURpUWwrM0xFbVdxdzJXVFN0RnJieWU5Slc1?=
 =?utf-8?B?QjczS3R3RjZwSkJCekhMTlQrWWpQT3ZHeHNSeFF6a3pXMU1jQ0V6S2pBZklR?=
 =?utf-8?B?WjFya2JiU2U0ajh2bFhpTWZrNnNLRzNLSTlHdHpCNW93aFFtUTBvQWN2Zksx?=
 =?utf-8?B?RitHeWlVRTk4ck9IZHgzTVRmZzlEeUVPbloxRVNNZ2UxYzJTSFhjUUFBejNu?=
 =?utf-8?B?NzRaREhmKzA1Q3dPWGZBWW44TWV1aW5wM1Fvckhwc2FTc0JvY0lUdmloeVJQ?=
 =?utf-8?B?YVdIVnducnpIakYyQWZlZ0d3U3JjNDR1NFVJZm5wL1Y5aC9JaGZ2djBSaGM5?=
 =?utf-8?B?b3YrUFYxVGtCcDZNVnUvZEMza201bGxCb2Q0b05pdkRVSTNZSm9pa1ZpSDFD?=
 =?utf-8?B?TTBSVnBuMWJMeGJCUUJVNTJrYzJodGFKWFpjdjVqeWZWREQrcXp3MFRYVFRG?=
 =?utf-8?B?TVFHOURyaTlWZUNrNlNVRUZvSXVwMnAzNGthYThTeFVRVDliQmpjUzNKM0Z6?=
 =?utf-8?Q?gidDDlxP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4792d28e-f0f4-4872-f002-08d8969e61ff
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 08:43:46.7946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhacFxBoLXzn0DCQdGiHKw+0PM+rdo+EnE0bvcrADZxo8LjBcqX8HM126DP8XypX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4947
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
Cc: Sam Ravnborg <sam@ravnborg.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, spice-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDIuMTIuMjAgdW0gMDg6NTkgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMDEuMTIuMjAgdW0gMTE6NDAgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+PiBSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiBvbiBwYXRj
aCAjMSAKPj4gYW5kICMxNS4KPj4KPj4gQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4gb24gcGF0Y2ggIzIgYW5kIAo+PiAjMTYuCj4KPiBDb3VsZCB5
b3UgYWRkIHRoZXNlIHBhdGNoZXMgdG8gdGhlIEFNRCB0cmVlPwoKQWxleCBpcyB1c3VhbGx5IHRo
ZSBvbmUgd2hvIHBpY2tzIHN1Y2ggc3R1ZmYgdXAuCgpCdXQgd2hlbiBwZW9wbGUgc2VuZCBvdXQg
cGF0Y2ggc2V0cyB3aGljaCBtaXggY2hhbmdlcyBmcm9tIGRpZmZlcmVudCAKZHJpdmVycyBpdCBp
cyBtb3JlIGNvbW1vbiB0byBwdXNoIHRoZW0gdGhyb3VnaCBkcm0tbWlzYy1uZXh0LgoKUmVnYXJk
cywKQ2hyaXN0aWFuLgoKPgo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+Cj4+Cj4+IFJlZ2FyZHMs
Cj4+IENocmlzdGlhbi4KPj4KPj4gQW0gMDEuMTIuMjAgdW0gMTE6MzUgc2NocmllYiBUaG9tYXMg
WmltbWVybWFubjoKPj4+IEFkaGVyZSB0byBrZXJuZWwgY29kaW5nIHN0eWxlLgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+Pj4g
QWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPj4+IEFj
a2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4+PiBDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+Pj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgNiArKystLS0KPj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAKPj4+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4+PiBpbmRleCA1ZjMwNDQyNWM5
NDguLmRhMjNjMGYyMTMxMSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCj4+PiBAQCAtNDkyMiw4ICs0OTIyLDggQEAgcGNpX2Vyc19yZXN1bHRf
dCAKPj4+IGFtZGdwdV9wY2lfZXJyb3JfZGV0ZWN0ZWQoc3RydWN0IHBjaV9kZXYgKnBkZXYsIHBj
aV9jaGFubmVsX3N0YQo+Pj4gwqDCoMKgwqDCoCBjYXNlIHBjaV9jaGFubmVsX2lvX25vcm1hbDoK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gUENJX0VSU19SRVNVTFRfQ0FOX1JFQ09WRVI7
Cj4+PiDCoMKgwqDCoMKgIC8qIEZhdGFsIGVycm9yLCBwcmVwYXJlIGZvciBzbG90IHJlc2V0ICov
Cj4+PiAtwqDCoMKgIGNhc2UgcGNpX2NoYW5uZWxfaW9fZnJvemVuOgo+Pj4gLcKgwqDCoMKgwqDC
oMKgIC8qCj4+PiArwqDCoMKgIGNhc2UgcGNpX2NoYW5uZWxfaW9fZnJvemVuOgo+Pj4gK8KgwqDC
oMKgwqDCoMKgIC8qCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIENhbmNlbCBhbmQgd2FpdCBm
b3IgYWxsIFREUnMgaW4gcHJvZ3Jlc3MgaWYgZmFpbGluZyB0bwo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKiBzZXTCoCBhZGV2LT5pbl9ncHVfcmVzZXQgaW4gYW1kZ3B1X2RldmljZV9sb2NrX2Fk
ZXYKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICoKPj4+IEBAIC01MDE0LDcgKzUwMTQsNyBAQCBw
Y2lfZXJzX3Jlc3VsdF90IGFtZGdwdV9wY2lfc2xvdF9yZXNldChzdHJ1Y3QgCj4+PiBwY2lfZGV2
ICpwZGV2KQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+Pj4gwqDCoMKgwqDCoCB9
Cj4+PiAtwqDCoMKgIGFkZXYtPmluX3BjaV9lcnJfcmVjb3ZlcnkgPSB0cnVlOwo+Pj4gK8KgwqDC
oCBhZGV2LT5pbl9wY2lfZXJyX3JlY292ZXJ5ID0gdHJ1ZTsKPj4+IMKgwqDCoMKgwqAgciA9IGFt
ZGdwdV9kZXZpY2VfcHJlX2FzaWNfcmVzZXQoYWRldiwgTlVMTCwgJm5lZWRfZnVsbF9yZXNldCk7
Cj4+PiDCoMKgwqDCoMKgIGFkZXYtPmluX3BjaV9lcnJfcmVjb3ZlcnkgPSBmYWxzZTsKPj4+IMKg
wqDCoMKgwqAgaWYgKHIpCj4+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
