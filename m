Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC37412B34C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 09:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D970889686;
	Fri, 27 Dec 2019 08:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0686E3EC;
 Fri, 27 Dec 2019 08:45:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcWgjYf5BTXh8XILjZEjPIkdyvc7soVvhnl3xkQmMhrR0XBbp5D9bXO7b7LAWMFVPMgDS5nwYJq2xASmYXs+ziUXSntBeYwiyu+GZtGjwtImXwUZgRRskN2rufV0f4pA8Kn8m0AVJ5dk0tiF9l4a22WPBTq+2JUMWUz2q1zFVK4PArTVRnc3PuKf4Oim71DP/O2YMS/lmoxA3lt0nJgXOkE4mHkwk9bf23G7yozvXo8yYzITT8vdmw02UgRO99pAQe2L9ulXZtHP/nbo2/qWD8NL808X5UeWFcgx3keaJxc+DAOLHLRo1hHeYrMaPdH00KQ0RwRNsmTBHrIG8HcjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moxbnkuzm36SKORRIAlEDPOnnoswSx85vIcFD73UJqw=;
 b=ZUOjDhlP99BRGufpIU4ilrRc7YfYe/scfvdhs0AC8HbLDrPiIjw+Of7LdyCZH6eTftUCa1Lmzl9dF4sAN0koItmMMUzRt0O/8CGWoskcJEILJ7o5/9ou7+YNOjEcEPiZTvcZUuYZLUdFKo8LrqQNuTvetaXOf/Dc0h81w2NpnLExtxyb1b4FWVYO5qAevPrIMh01mkCjvR6ErBEG3B6J0Rn6gMh0XeuNSbY1vsh1Sd4J+qVr/jAPN27DERz+wUMwsSLQKaeDmy+vEmvZDasKKN5rF2pY4OrujVdAdATFK7Fjd5JKWUfjeDefY7FHM9wgqbxlaSuJUzU0V/xY6ky6qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moxbnkuzm36SKORRIAlEDPOnnoswSx85vIcFD73UJqw=;
 b=aS3i/HmNbOKCeU2cXasCM7pf4oOEmKkPsQdvzJhUOA8RZmzkc4N1nkZBTdq0hOBvZruSvUaz7XkepuMX6RHTLrprKDN8O1XEXUb5xXbz7NINSE9GygsxNXwBLlShBbiEl6STZr4aohDjhJECtltaJbEj+u8O7VWseRDWAtxYfjM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3549.namprd12.prod.outlook.com (20.179.83.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Fri, 27 Dec 2019 08:44:58 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::18c4:9fcb:3813:14f7]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::18c4:9fcb:3813:14f7%6]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 08:44:57 +0000
Date: Fri, 27 Dec 2019 16:44:47 +0800
From: Huang Rui <ray.huang@amd.com>
To: yu kuai <yukuai3@huawei.com>
Subject: Re: [PATCH] drm/radeon: remove three set but not used variable
Message-ID: <20191227084444.GA3041@jenkins-Celadon-RN>
References: <20191226120750.15106-1-yukuai3@huawei.com>
Content-Disposition: inline
In-Reply-To: <20191226120750.15106-1-yukuai3@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: HK2PR06CA0024.apcprd06.prod.outlook.com
 (2603:1096:202:2e::36) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
MIME-Version: 1.0
Received: from jenkins-Celadon-RN (180.167.199.189) by
 HK2PR06CA0024.apcprd06.prod.outlook.com (2603:1096:202:2e::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 08:44:54 +0000
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cb3287eb-23bb-4df7-1f75-08d78aa90d74
X-MS-TrafficTypeDiagnostic: MN2PR12MB3549:|MN2PR12MB3549:|MN2PR12MB3549:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3549DFCF0657456D6C6EBA99EC2A0@MN2PR12MB3549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-Forefront-PRVS: 0264FEA5C3
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(189003)(199004)(6666004)(86362001)(81156014)(33656002)(9686003)(26005)(55016002)(66476007)(66556008)(66946007)(45080400002)(966005)(478600001)(6496006)(81166006)(52116002)(66574012)(8936002)(316002)(1076003)(8676002)(4326008)(6862004)(186003)(5660300002)(956004)(2906002)(33716001)(16526019);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3549;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tiIjMsqeT3Sx8L/DRchrdt29xAjx9OSSEX6G4zNhVu0E9msG2q5GPUoFcm1e8wDS+xi/wGCXEa8V2J5akR4sGQO7jfiapfuD5+SUWZz16mXkvtFWUMvJwOrjyXIMBdjRfpvc7TqcHyNKWMDTg6tcZ/NCW+WVy6uxqd2RGRfohcA+6TBkjk3zi4pq41ju1dzsYoWf6ArwlZQF97In+NFx4mCcpCcYnPK5y1giLb69Hq1TKIKus0sOIXPbB6/UaGEuev2jZfZjbNUUbBJu51JErKiRlb0SCJLMD5KgiOzE3profh8BYNBDkrMukTzgb/VkomG4nVDwgYurQ3q5DSqJvOCS6Mojoxx3bZCmRWVk3FeqhvjUlIBxp0LCfAOB4fyOmE1qW/ceQMViBcDuR7lr5qnWx+QdeKp4XIC6t3CZvIGpDj5R8Gh8yDmtpXj8vG6KVrPuXYR5gVXwt1qTQx+b+lZcUVb7FWy8r1JnbDvMXy4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3287eb-23bb-4df7-1f75-08d78aa90d74
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2019 08:44:57.8023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0UIVhuJWHOFvPZG1Gvvx31kaKrkJLXFg1NrflQ16Y2uR0JlHHQD0yHx5/SZHjvnEpjY50DpsJySOFBbqSEBEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3549
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
Cc: yi.zhang@huawei.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhengbin13@huawei.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgMjYsIDIwMTkgYXQgMDg6MDc6NTBQTSArMDgwMCwgeXUga3VhaSB3cm90ZToK
PiBGaXhlcyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4gZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYzogSW4gZnVuY3Rpb24KPiChrnJh
ZGVvbl9nZXRfYXRvbV9jb25uZWN0b3JfaW5mb19mcm9tX29iamVjdF90YWJsZaGvOgo+IGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmM6NjUxOjI2OiB3YXJuaW5nOiB2YXJp
YWJsZQo+IKGuZ3JwaF9vYmpfbnVtoa8gc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KPiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5jOjY1
MToxMzogd2FybmluZzogdmFyaWFibGUKPiChrmdycGhfb2JqX2lkoa8gc2V0IGJ1dCBub3QgdXNl
ZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9hdG9tYmlvcy5jOjU3MzozNzogd2FybmluZzogdmFyaWFibGUKPiChrmNvbl9vYmpfdHlw
ZaGvIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4gVGhl
eSBhcmUgbmV2ZXIgdXNlZCwgYW5kIHNvIGNhbiBiZSByZW1vdmVkLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IHl1IGt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KClRoYW5rcyEKCkFja2VkLWJ5OiBIdWFu
ZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fYXRvbWJpb3MuYyB8IDE1ICsrLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2F0b21iaW9zLmMKPiBpbmRleCAwNzJlNmRhZWRmN2EuLjg0OGVmNjhkOTA4
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYwo+IEBAIC01
NzAsNyArNTcwLDcgQEAgYm9vbCByYWRlb25fZ2V0X2F0b21fY29ubmVjdG9yX2luZm9fZnJvbV9v
YmplY3RfdGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgCQlwYXRoX3NpemUgKz0gbGUx
Nl90b19jcHUocGF0aC0+dXNTaXplKTsKPiAgCj4gIAkJaWYgKGRldmljZV9zdXBwb3J0ICYgbGUx
Nl90b19jcHUocGF0aC0+dXNEZXZpY2VUYWcpKSB7Cj4gLQkJCXVpbnQ4X3QgY29uX29ial9pZCwg
Y29uX29ial9udW0sIGNvbl9vYmpfdHlwZTsKPiArCQkJdWludDhfdCBjb25fb2JqX2lkLCBjb25f
b2JqX251bTsKPiAgCj4gIAkJCWNvbl9vYmpfaWQgPQo+ICAJCQkgICAgKGxlMTZfdG9fY3B1KHBh
dGgtPnVzQ29ubk9iamVjdElkKSAmIE9CSkVDVF9JRF9NQVNLKQo+IEBAIC01NzgsOSArNTc4LDYg
QEAgYm9vbCByYWRlb25fZ2V0X2F0b21fY29ubmVjdG9yX2luZm9fZnJvbV9vYmplY3RfdGFibGUo
c3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgCQkJY29uX29ial9udW0gPQo+ICAJCQkgICAgKGxl
MTZfdG9fY3B1KHBhdGgtPnVzQ29ubk9iamVjdElkKSAmIEVOVU1fSURfTUFTSykKPiAgCQkJICAg
ID4+IEVOVU1fSURfU0hJRlQ7Cj4gLQkJCWNvbl9vYmpfdHlwZSA9Cj4gLQkJCSAgICAobGUxNl90
b19jcHUocGF0aC0+dXNDb25uT2JqZWN0SWQpICYKPiAtCQkJICAgICBPQkpFQ1RfVFlQRV9NQVNL
KSA+PiBPQkpFQ1RfVFlQRV9TSElGVDsKPiAgCj4gIAkJCS8qIFRPRE8gQ1Ygc3VwcG9ydCAqLwo+
ICAJCQlpZiAobGUxNl90b19jcHUocGF0aC0+dXNEZXZpY2VUYWcpID09Cj4gQEAgLTY0OCwxNSAr
NjQ1LDcgQEAgYm9vbCByYWRlb25fZ2V0X2F0b21fY29ubmVjdG9yX2luZm9fZnJvbV9vYmplY3Rf
dGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgCQkJcm91dGVyLmRkY192YWxpZCA9IGZh
bHNlOwo+ICAJCQlyb3V0ZXIuY2RfdmFsaWQgPSBmYWxzZTsKPiAgCQkJZm9yIChqID0gMDsgaiA8
ICgobGUxNl90b19jcHUocGF0aC0+dXNTaXplKSAtIDgpIC8gMik7IGorKykgewo+IC0JCQkJdWlu
dDhfdCBncnBoX29ial9pZCwgZ3JwaF9vYmpfbnVtLCBncnBoX29ial90eXBlOwo+IC0KPiAtCQkJ
CWdycGhfb2JqX2lkID0KPiAtCQkJCSAgICAobGUxNl90b19jcHUocGF0aC0+dXNHcmFwaGljT2Jq
SWRzW2pdKSAmCj4gLQkJCQkgICAgIE9CSkVDVF9JRF9NQVNLKSA+PiBPQkpFQ1RfSURfU0hJRlQ7
Cj4gLQkJCQlncnBoX29ial9udW0gPQo+IC0JCQkJICAgIChsZTE2X3RvX2NwdShwYXRoLT51c0dy
YXBoaWNPYmpJZHNbal0pICYKPiAtCQkJCSAgICAgRU5VTV9JRF9NQVNLKSA+PiBFTlVNX0lEX1NI
SUZUOwo+IC0JCQkJZ3JwaF9vYmpfdHlwZSA9Cj4gKwkJCQl1aW50OF90IGdycGhfb2JqX3R5cGUg
PQo+ICAJCQkJICAgIChsZTE2X3RvX2NwdShwYXRoLT51c0dyYXBoaWNPYmpJZHNbal0pICYKPiAg
CQkJCSAgICAgT0JKRUNUX1RZUEVfTUFTSykgPj4gT0JKRUNUX1RZUEVfU0hJRlQ7Cj4gIAo+IC0t
IAo+IDIuMTcuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3Vy
bD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5m
byUyRmFtZC1nZngmYW1wO2RhdGE9MDIlN0MwMSU3Q3JheS5odWFuZyU0MGFtZC5jb20lN0M4ZDlk
MTQ2ZWViY2E0NzJlNWU1OTA4ZDc4YTEwOTMzZiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5
NGUxODNkJTdDMCU3QzAlN0M2MzcxMjk2NzYxMDM4MTM2NjUmYW1wO3NkYXRhPTB4UmhITzJVT0li
ZkV6WVY4SFRHdFNUSEZ3JTJGOFI2NlRmeTQ0WXZpS3BtUSUzRCZhbXA7cmVzZXJ2ZWQ9MApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
