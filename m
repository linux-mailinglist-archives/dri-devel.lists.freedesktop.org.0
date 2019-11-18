Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6307C100ADE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 18:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2F089C82;
	Mon, 18 Nov 2019 17:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820082.outbound.protection.outlook.com [40.107.82.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F20F89C82;
 Mon, 18 Nov 2019 17:52:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrtFvQl7Omaf59jKYtZesojHlbRkI+p0ZLhlj2w6J2Aq595hTuwMRQe7l4zh/aJy/KWTHpe/MgVqufYiN72xLRuWmonlkD6qX4kO7N2f7MgUokyTqGSyxMcssNd6Ok4pZ1OcYJgb4c49A2lrbKe4JAreVjxrHzUqS/MaDPetcIYr6EqLc+izm6WvLihPB8x7Jw20STyMq6IaK1v5+PulLo6/DJEpPSNYK9+SVHA9lNlBK9FhOmXYoKIxTZKpEjGJ5L474EOoG7BIz5X646fSo16NzVaXpo/ZOKf/fH2smhqYR2Q6NYoty6DBV3nBb/7lxiYJo97dwo1uot8mZ2z0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VSJUtEhda+FnkSnUu1ZIt8xstFe+w6hkfs7N/NlOAo=;
 b=TgrtSiFvr0oRQnDdTulAbHlRtKHvoqLzRimzok6dBb0MQDX77eaeRXWYLaVSTq0ttuAFckNDr8B8TaJTMACGfFlDZD5uB8qqaHGHwtMO/dmE4ZwBujESNRwBPbUviXgJRITXpmg/7Is+yaKyX214pp9z2ihLzBiIfqFJfjzqGIopf9azv3Fd73kxf0UUvac7bqUKJeOIkwhmIlmW2QrhMZbFt/Vnd7MkdpedNOIUFCLOx16PkJYrNjtryu7Dc37SAklskTDeevtI5Dq3Oi/POCw9QT6oCVSbLDu/QxxoxrCMTTOeSdNuTxAoLTDfiPzc/7yIwDOTakxCuFFS0RJO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0001.namprd12.prod.outlook.com
 (2603:10b6:910:16::11) by CY4PR12MB1880.namprd12.prod.outlook.com
 (2603:10b6:903:126::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.27; Mon, 18 Nov
 2019 17:52:35 +0000
Received: from DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::201) by CY4PR1201CA0001.outlook.office365.com
 (2603:10b6:910:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.29 via Frontend
 Transport; Mon, 18 Nov 2019 17:52:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT013.mail.protection.outlook.com (10.13.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 18 Nov 2019 17:52:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 Nov
 2019 11:52:35 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 Nov
 2019 11:52:34 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 18 Nov 2019 11:52:34 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: 
Subject: [PATCH v2] drm/scheduler: Avoid accessing freed bad job.
Date: Mon, 18 Nov 2019 12:52:25 -0500
Message-ID: <1574099545-20430-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(428003)(199004)(189003)(70586007)(186003)(53416004)(2906002)(5660300002)(6666004)(336012)(486006)(126002)(476003)(44832011)(1671002)(426003)(16586007)(305945005)(316002)(36756003)(54906003)(47776003)(478600001)(7696005)(51416003)(4326008)(50466002)(86362001)(450100002)(70206006)(8676002)(81156014)(81166006)(26005)(356004)(2616005)(109986005)(48376002)(8936002)(50226002)(14444005)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1880; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbf87687-7860-45fd-5bf0-08d76c501858
X-MS-TrafficTypeDiagnostic: CY4PR12MB1880:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1880F85CD965FC68E3BA9D73EA4D0@CY4PR12MB1880.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0225B0D5BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VR8njExmg1h0Jo5JGjRiPAV6P6K/CHWoZEJQzCfJNc9OwhJ/8gVD0kgEhXUKOliA6ofQjdPPgFlz98YT2SR6Hp/Tss6pfH1AHGsixUi2EOOgdOlRPqbmaOeOplRVgteTzWEqz4hfLNf7QzxWSQpSvMbQk/uVp3aqT5W3TuTf+DORrtsWs05DlX4dSEGU7c5wLsK9qNl4UFB0FQ+3f9BlocGHcifYRtTU1RrIpWqLe+LHxfmx156l9AK7TMCisDlWFMsVI0d0hmR1e+oyrknP18EsL0se+xyZ9AOmiTJ+TZrRy/5O+zovK/aRtel4nQ3WoDrau4soNl9hghTMt0auDpXqKB1MYoSFQMaMXmkqIACifIaBaURs6HEI02d2VEUfnUpDsiT3PFGqzZ5e2bnmDDtJkqCzikfgHW3s9+PEBgiE27Ah2zMr0+pTmij8+nma
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2019 17:52:35.7001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf87687-7860-45fd-5bf0-08d76c501858
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1880
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VSJUtEhda+FnkSnUu1ZIt8xstFe+w6hkfs7N/NlOAo=;
 b=uwXzpxcY0mRoNN8eOgNMSsPEO/gcz2s3spnKgsDIOxhHR1OMARdoVfyHr6PO4BUB35m7A/Ftxkw/+wAVXj8q79f5hD0OZukwh4Cl/6W/ZXKknNF0FGyRv4lgORgdVXWEjDzvk/Sg20CSPBDGtoq2C7oX6VhedNjSNgi0TrJ8rkg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Emily.Deng@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvYmxlbToKRHVlIHRvIGEgcmFjZSBiZXR3ZWVuIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMgaW4g
c2NoZWQgdGhyZWFkIGFuZApkcm1fc2NoZWRfam9iX3RpbWVkb3V0IGluIHRpbWVvdXQgd29yayB0
aGVyZSBpcyBhIHBvc3NpYmxpdHkgdGhhdApiYWQgam9iIHdhcyBhbHJlYWR5IGZyZWVkIHdoaWxl
IHN0aWxsIGJlaW5nIGFjY2Vzc2VkIGZyb20gdGhlCnRpbWVvdXQgdGhyZWFkLgoKRml4OgpJbnN0
ZWFkIG9mIGp1c3QgcGVla2luZyBhdCB0aGUgYmFkIGpvYiBpbiB0aGUgbWlycm9yIGxpc3QKcmVt
b3ZlIGl0IGZyb20gdGhlIGxpc3QgdW5kZXIgbG9jayBhbmQgdGhlbiBwdXQgaXQgYmFjayBsYXRl
ciB3aGVuCndlIGFyZSBnYXJhbnRlZWQgbm8gcmFjZSB3aXRoIG1haW4gc2NoZWQgdGhyZWFkIGlz
IHBvc3NpYmxlIHdoaWNoCmlzIGFmdGVyIHRoZSB0aHJlYWQgaXMgcGFya2VkLgoKdjI6IExvY2sg
YXJvdW5kIHByb2Nlc3NpbmcgcmluZ19taXJyb3JfbGlzdCBpbiBkcm1fc2NoZWRfY2xlYW51cF9q
b2JzLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCA0
NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzgg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jCmluZGV4IDgwZGRiZGYuLmIwNWIyMTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfbWFpbi5jCkBAIC0yODcsMTAgKzI4NywyNCBAQCBzdGF0aWMgdm9pZCBkcm1fc2No
ZWRfam9iX3RpbWVkb3V0KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAl1bnNpZ25lZCBsb25n
IGZsYWdzOwogCiAJc2NoZWQgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGRybV9ncHVfc2No
ZWR1bGVyLCB3b3JrX3Rkci53b3JrKTsKKworCS8qCisJICogUHJvdGVjdHMgYWdhaW5zdCBjb25j
dXJyZW50IGRlbGV0aW9uIGluIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMgdGhhdAorCSAqIGlzIGFs
cmVhZHkgaW4gcHJvZ3Jlc3MuCisJICovCisJc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2Jf
bGlzdF9sb2NrLCBmbGFncyk7CiAJam9iID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZzY2hl
ZC0+cmluZ19taXJyb3JfbGlzdCwKIAkJCQkgICAgICAgc3RydWN0IGRybV9zY2hlZF9qb2IsIG5v
ZGUpOwogCiAJaWYgKGpvYikgeworCQkvKgorCQkgKiBSZW1vdmUgdGhlIGJhZCBqb2Igc28gaXQg
Y2Fubm90IGJlIGZyZWVkIGJ5IGFscmVhZHkgaW4gcHJvZ3Jlc3MKKwkJICogZHJtX3NjaGVkX2Ns
ZWFudXBfam9icy4gSXQgd2lsbCBiZSByZWluc3J0ZWQgYmFjayBhZnRlciBzY2hlZC0+dGhyZWFk
CisJCSAqIGlzIHBhcmtlZCBhdCB3aGljaCBwb2ludCBpdCdzIHNhZmUuCisJCSAqLworCQlsaXN0
X2RlbF9pbml0KCZqb2ItPm5vZGUpOworCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZC0+
am9iX2xpc3RfbG9jaywgZmxhZ3MpOworCiAJCWpvYi0+c2NoZWQtPm9wcy0+dGltZWRvdXRfam9i
KGpvYik7CiAKIAkJLyoKQEAgLTMwMiw2ICszMTYsOCBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRf
am9iX3RpbWVkb3V0KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAkJCXNjaGVkLT5mcmVlX2d1
aWx0eSA9IGZhbHNlOwogCQl9CiAJfQorCWVsc2UKKwkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgm
c2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsKIAogCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hl
ZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwogCWRybV9zY2hlZF9zdGFydF90aW1lb3V0KHNjaGVk
KTsKQEAgLTM3Myw2ICszODksMTkgQEAgdm9pZCBkcm1fc2NoZWRfc3RvcChzdHJ1Y3QgZHJtX2dw
dV9zY2hlZHVsZXIgKnNjaGVkLCBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqYmFkKQogCWt0aHJlYWRf
cGFyayhzY2hlZC0+dGhyZWFkKTsKIAogCS8qCisJICogUmVpbnNlcnQgYmFjayB0aGUgYmFkIGpv
YiBoZXJlIC0gbm93IGl0J3Mgc2FmZSBhcyBkcm1fc2NoZWRfY2xlYW51cF9qb2JzCisJICogY2Fu
bm90IHJhY2UgYWdhaW5zdCB1cyBhbmQgcmVsZWFzZSB0aGUgYmFkIGpvYiBhdCB0aGlzIHBvaW50
IC0gd2UgcGFya2VkCisJICogKHdhaXRlZCBmb3IpIGFueSBpbiBwcm9ncmVzcyAoZWFybGllcikg
Y2xlYW51cHMgYW5kIGFueSBsYXRlciBvbmVzIHdpbGwKKwkgKiBiYWlsIG91dCBkdWUgdG8gc2No
ZWQtPnRocmVhZCBiZWluZyBwYXJrZWQuCisJICovCisJaWYgKGJhZCAmJiBiYWQtPnNjaGVkID09
IHNjaGVkKQorCQkvKgorCQkgKiBBZGQgYXQgdGhlIGhlYWQgb2YgdGhlIHF1ZXVlIHRvIHJlZmxl
Y3QgaXQgd2FzIHRoZSBlYXJsaWVzdAorCQkgKiBqb2IgZXh0cmFjdGVkLgorCQkgKi8KKwkJbGlz
dF9hZGQoJmJhZC0+bm9kZSwgJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0KTsKKworCS8qCiAJICog
SXRlcmF0ZSB0aGUgam9iIGxpc3QgZnJvbSBsYXRlciB0byAgZWFybGllciBvbmUgYW5kIGVpdGhl
ciBkZWFjdGl2ZQogCSAqIHRoZWlyIEhXIGNhbGxiYWNrcyBvciByZW1vdmUgdGhlbSBmcm9tIG1p
cnJvciBsaXN0IGlmIHRoZXkgYWxyZWFkeQogCSAqIHNpZ25hbGVkLgpAQCAtNjU2LDE2ICs2ODUs
MTkgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2NsZWFudXBfam9icyhzdHJ1Y3QgZHJtX2dwdV9z
Y2hlZHVsZXIgKnNjaGVkKQogCSAgICBfX2t0aHJlYWRfc2hvdWxkX3Bhcmsoc2NoZWQtPnRocmVh
ZCkpCiAJCXJldHVybjsKIAotCi0Jd2hpbGUgKCFsaXN0X2VtcHR5KCZzY2hlZC0+cmluZ19taXJy
b3JfbGlzdCkpIHsKKwkvKiBTZWUgZHJtX3NjaGVkX2pvYl90aW1lZG91dCBmb3Igd2h5IHRoZSBs
b2NraW5nIGlzIGhlcmUgKi8KKwl3aGlsZSAodHJ1ZSkgewogCQlzdHJ1Y3QgZHJtX3NjaGVkX2pv
YiAqam9iOwogCi0JCWpvYiA9IGxpc3RfZmlyc3RfZW50cnkoJnNjaGVkLT5yaW5nX21pcnJvcl9s
aXN0LAotCQkJCSAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiwgbm9kZSk7Ci0JCWlmICghZG1h
X2ZlbmNlX2lzX3NpZ25hbGVkKCZqb2ItPnNfZmVuY2UtPmZpbmlzaGVkKSkKKwkJc3Bpbl9sb2Nr
X2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7CisJCWpvYiA9IGxpc3RfZmly
c3RfZW50cnlfb3JfbnVsbCgmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsCisJCQkJCSAgICAgICBz
dHJ1Y3QgZHJtX3NjaGVkX2pvYiwgbm9kZSk7CisKKwkJaWYgKCFqb2IgfHwgIWRtYV9mZW5jZV9p
c19zaWduYWxlZCgmam9iLT5zX2ZlbmNlLT5maW5pc2hlZCkpIHsKKwkJCXNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7CiAJCQlicmVhazsKKwkJfQog
Ci0JCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwogCQkv
KiByZW1vdmUgam9iIGZyb20gcmluZ19taXJyb3JfbGlzdCAqLwogCQlsaXN0X2RlbF9pbml0KCZq
b2ItPm5vZGUpOwogCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9j
aywgZmxhZ3MpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
