Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD973F751C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 14:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42A56E228;
	Mon, 11 Nov 2019 13:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720072.outbound.protection.outlook.com [40.107.72.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720716E228;
 Mon, 11 Nov 2019 13:37:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ci9mzfIET5HmE9gHa6go6YqlV2iytBlq91/10Zpl5WtEdLokjHOg5NjAnfhJ+uun2YyWbGLVoLoAW+tWtXtOg+dBT9hRRi+7SnEDUAxaXdw2mPuP8iaQl6MIe1O2t8TeWRI5iUmjLo2h17uaV/NrkroVm/RFmndk2wjByLLdaoh1bSV/Pwg7Sfe3Wu/d7LD66jWKfUWNLn3DbxahHNilHOOrXufpXYJQk2qoAROph8UgCN4R7PLoNCKzAjpMaXl6R/SpbhHtY1qInBOQTxOLiQ1O1P7jcynKM/CeDpiSYw3n8pJjag9hzlI6HNyTL807MJo2ViTcMtDWnt0vtw6txg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHUQCWUslgICn8KAxgJOIo8qG3oXQB+1PYLIhSfNOh8=;
 b=AcLD7tzASFByj623gcF2uUq1AHE7FLI4xl5M1YvFaBGTENhrnjG4Nq+z4yWW7DVghTEITsQxJO8hGvXBlDmvOHas64lsLqlY+F8wqzbz4yxNsKB4BHYz8oSUGBaphZcM8mKTYX6VD1KWpCNFyq7f2qPicZR8VCIxjQDzJrCI+vc4aK701xEN2SbzG5WQaJZC1+UraacsFdC6Wf/uO7icLkLffO+fKlTRSZkLRQ/U6afpy+/0t4wWiTNm8hBkr4Y5udcuAIrrrTYI6ifgvnqfgLLSLUwHz8oy989QEye6N6SaweYkCc5442YrIPPI6CDVtJtDOHs1OnYkzm2fM4zuiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2920.namprd12.prod.outlook.com (20.179.93.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Mon, 11 Nov 2019 13:37:43 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f950:f7be:9139:7c26]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f950:f7be:9139:7c26%7]) with mapi id 15.20.2408.025; Mon, 11 Nov 2019
 13:37:36 +0000
Subject: Re: [PATCH][next] drm/amd/display: fix spelling mistake "exeuction"
 -> "execution"
To: Colin King <colin.king@canonical.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20191109194923.231655-1-colin.king@canonical.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <633bbabf-56d4-ad4a-9d4e-9562e7122d17@amd.com>
Date: Mon, 11 Nov 2019 08:37:31 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <20191109194923.231655-1-colin.king@canonical.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::42)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c8826c81-70be-4524-6303-08d766ac501d
X-MS-TrafficTypeDiagnostic: BYAPR12MB2920:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB2920FDE24EC60807E806F8B1EC740@BYAPR12MB2920.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0218A015FA
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(189003)(199004)(3846002)(6116002)(2906002)(6436002)(8936002)(81156014)(230700001)(81166006)(229853002)(6486002)(99286004)(8676002)(58126008)(316002)(110136005)(66946007)(6246003)(50466002)(5660300002)(66556008)(66476007)(31686004)(14454004)(478600001)(52116002)(2486003)(23676004)(66066001)(76176011)(65956001)(4326008)(47776003)(65806001)(6666004)(25786009)(11346002)(446003)(86362001)(36756003)(31696002)(305945005)(486006)(7736002)(186003)(476003)(6506007)(2616005)(26005)(6512007)(53546011)(386003)(921003)(1121003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2920;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5q2r1zA7tgqVkQmv7BCmm9pNKSB+39nwhhr2AHJ4PLr6qB6nbttNofGUAO5ead5+gABwHOF+N5rc17Pvl/ao6ZLJC7XfvbNGSyhclQ7UlHvRwK6eAZH/gvtv8AmjFPp5WOerwWwqKyHmc6Ke9F6wWGaTovnTDpStEKi5I1HPWsP+XZ2C+xlj/TZR6V3PgJxMim76ElEuPl+TsG4MPA9U9ta42WebBJ6QdBVWfSKiDwP2vqXfPdG/lcUaNLAR0CB9Ns/tqfGLQE7cKcdUqCWjZTECBUSuULQeWOQFiDR8BKW0ZGrOvzWeY5r1/uCbwiTHQ6CArlrytiP+IlATdp5GCh3pdWbDLadUzqPoqbGdSTiXTQHAmqTfg8wVIEKUvEmknKxRnF0SUUEOhNTbT8jBqNum179IKagiQrUazJcnuiUt4BPNWfhVa6rZF9FOly+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8826c81-70be-4524-6303-08d766ac501d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2019 13:37:36.4513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YFEIXObCDkVE2XEZvAoZ9t8WpijZKIZH1isS6mbx2nY5HG1K6OdSdn3DOo40HRAY8zW+PO2ffpj42DDB3wPbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2920
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHUQCWUslgICn8KAxgJOIo8qG3oXQB+1PYLIhSfNOh8=;
 b=wvGNcApPkjd0O0PUsJoCHU/NAcLQLRD0tKg81+woUgTZVLtbQsJRi691GoInfqU2xICE6EQmMc65fh2hynDL5wknQJIix+L8wrzd39ekKy6WnY9ZaOjMwMAic0x0A38gYqVsuVEtvKiIqITlDbDC2QuRuv/Z/zkWHfkrT4VGi5s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0wOSAyOjQ5IHAubS4sIENvbGluIEtpbmcgd3JvdGU6Cj4gRnJvbTogQ29saW4g
SWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAKPiBUaGVyZSBhcmUgc3BlbGxp
bmcgbWlzdGFrZXMgaW4gYSBEQ19FUlJPUiBtZXNzYWdlIGFuZCBhIGNvbW1lbnQuCj4gRml4IHRo
ZXNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9u
aWNhbC5jb20+CgpSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6
bGF1c2thc0BhbWQuY29tPgoKVGhhbmtzIQoKTmljaG9sYXMgS2F6bGF1c2thcwoKPiAtLS0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19kbXViX3Nydi5jICAgIHwgMiArLQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RtdWIvaW5jL2RtdWJfc3J2LmggfCAyICst
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2RtdWJfc3J2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfZG11Yl9zcnYuYwo+IGluZGV4
IDYxY2VmZTBhMzc5MC4uYjY1YjY2MDI1MjY3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY19kbXViX3Nydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjX2RtdWJfc3J2LmMKPiBAQCAtOTIsNyArOTIsNyBAQCB2b2lkIGRjX2Rt
dWJfc3J2X2NtZF9leGVjdXRlKHN0cnVjdCBkY19kbXViX3NydiAqZGNfZG11Yl9zcnYpCj4gICAK
PiAgIAlzdGF0dXMgPSBkbXViX3Nydl9jbWRfZXhlY3V0ZShkbXViKTsKPiAgIAlpZiAoc3RhdHVz
ICE9IERNVUJfU1RBVFVTX09LKQo+IC0JCURDX0VSUk9SKCJFcnJvciBzdGFydGluZyBETVVCIGV4
ZXVjdGlvbjogc3RhdHVzPSVkXG4iLCBzdGF0dXMpOwo+ICsJCURDX0VSUk9SKCJFcnJvciBzdGFy
dGluZyBETVVCIGV4ZWN1dGlvbjogc3RhdHVzPSVkXG4iLCBzdGF0dXMpOwo+ICAgfQo+ICAgCj4g
ICB2b2lkIGRjX2RtdWJfc3J2X3dhaXRfaWRsZShzdHJ1Y3QgZGNfZG11Yl9zcnYgKmRjX2RtdWJf
c3J2KQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZG11Yi9pbmMv
ZG11Yl9zcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kbXViL2luYy9kbXViX3Ny
di5oCj4gaW5kZXggYWE4ZjAzOTY2MTZkLi40NWU0MjdkMTk1MmUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RtdWIvaW5jL2RtdWJfc3J2LmgKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZG11Yi9pbmMvZG11Yl9zcnYuaAo+IEBAIC00MTYsNyAr
NDE2LDcgQEAgZW51bSBkbXViX3N0YXR1cyBkbXViX3Nydl9jbWRfcXVldWUoc3RydWN0IGRtdWJf
c3J2ICpkbXViLAo+ICAgICogZG11Yl9zcnZfY21kX2V4ZWN1dGUoKSAtIEV4ZWN1dGVzIGEgcXVl
dWVkIHNlcXVlbmNlIHRvIHRoZSBkbXViCj4gICAgKiBAZG11YjogdGhlIGRtdWIgc2VydmljZQo+
ICAgICoKPiAtICogQmVnaW5zIGV4ZXVjdGlvbiBvZiBxdWV1ZWQgY29tbWFuZHMgb24gdGhlIGRt
dWIuCj4gKyAqIEJlZ2lucyBleGVjdXRpb24gb2YgcXVldWVkIGNvbW1hbmRzIG9uIHRoZSBkbXVi
Lgo+ICAgICoKPiAgICAqIFJldHVybjoKPiAgICAqICAgRE1VQl9TVEFUVVNfT0sgLSBzdWNjZXNz
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
