Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C51FCF3C5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5936E1EE;
	Tue,  8 Oct 2019 07:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4058 seconds by postgrey-1.36 at gabe;
 Mon, 07 Oct 2019 11:17:14 UTC
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B126E52F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 11:17:14 +0000 (UTC)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x97A4J7H000557; Mon, 7 Oct 2019 06:09:17 -0400
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2057.outbound.protection.outlook.com [104.47.38.57])
 by mx0b-00128a01.pphosted.com with ESMTP id 2vemxaqx36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2019 06:09:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZ03jOKJwSyD2rX4uv1Tz7SHxNGlNNanXBhhOTO2V0nDa+9CMz0EUrrw3PxPJVtmHVbznGb9n0/4KNdoVqzrPGgpSPUyg9GG6LXM2LyiwAQ2il4FLusgHUKQ6o4szP1IUFXTLO+f9qYZ1zPo4L89dqNFivLWbp4lUKF0maJxp/YL5dAnkhPaYdL+UBmr0LDC9PzZZ1PkmOQGQdgTgnSf7Un8tD4vKn4NHm1eQ6ktoQ20QsNyH9S2hLTzHIVMv/otcSHCkZq7RYgpZYMLVvyypRK8oOKJAwG1GNK3YgYs7qGAYSdUQMSdH55BL4JF0qOMpEXw0iMELhdNYRxMlT8aJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2ZzhhRlr4o+nfr6dEHg8w6bxHM+TS6FEBwsWV3YAaA=;
 b=C08HQBrw66Zd6Xrk/bDcvzeECKPLH7+A8+aO6SqR1v8pxGKkBNQsqUxJ218lJ86QZqdU93WYuBHJblCZXaNkTzhQE/sMeuHbysYjLX8tb7oAdv0+iM78KaL5zNJk+O3SI/Ww10qa9HtD/jAE9WkPy3nXlmGoe0S8gaAvN9Z4D/aaU5lV+ClDPjCd8VkZl8h6+guHiRpajGUQKryD63fUG09c+bP2hZnrTSNe006TksZULC0JvH3xwSbYUAwgSvhi2/LTOlGEliCSCYKP+KHh531czl18GNJUDSRtbx2DVRotQOjMuTVAgeCdZ4Z95qsQombJ3sxVqK1Nj3qe8l0YCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=baylibre.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
Received: from BYAPR03CA0012.namprd03.prod.outlook.com (2603:10b6:a02:a8::25)
 by BYAPR03MB3720.namprd03.prod.outlook.com (2603:10b6:a02:b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Mon, 7 Oct
 2019 10:09:16 +0000
Received: from CY1NAM02FT054.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::208) by BYAPR03CA0012.outlook.office365.com
 (2603:10b6:a02:a8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19 via Frontend
 Transport; Mon, 7 Oct 2019 10:09:15 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 CY1NAM02FT054.mail.protection.outlook.com (10.152.74.100) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2327.21
 via Frontend Transport; Mon, 7 Oct 2019 10:09:15 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x97A9D00016239
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 7 Oct 2019 03:09:13 -0700
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Mon, 7 Oct 2019 06:09:13 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm: bridge: adv7511: Enable SPDIF DAI
Date: Mon, 7 Oct 2019 13:06:41 +0300
Message-ID: <20191007100641.25599-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(54906003)(7416002)(51416003)(48376002)(70206006)(7696005)(4326008)(1076003)(5660300002)(26005)(70586007)(6916009)(106002)(44832011)(50466002)(2616005)(126002)(426003)(476003)(336012)(36756003)(186003)(486006)(8676002)(47776003)(2870700001)(107886003)(7636002)(8936002)(246002)(14444005)(316002)(478600001)(305945005)(86362001)(50226002)(2351001)(356004)(6666004)(2906002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR03MB3720; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05927766-8a6c-4385-5c4e-08d74b0e68c4
X-MS-TrafficTypeDiagnostic: BYAPR03MB3720:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3720429D697520D1C3569CD99B9B0@BYAPR03MB3720.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-Forefront-PRVS: 01834E39B7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D/7nceK/4na2zKyxahg+RPwkVvAefXSF1BlWez49IWC84jBN9iz64B0qA/VoxyZsE+maa0W9nj5eXuBj7cgZL9ll2+mdgDtNLCW5ZeZI517C9EanSV8/H+Dpz1WvSgoMGCzKQOl5kZcneVEUaFFzmvZu5+9I21UiCyO0rl1mfjvdqyjJ6dGOW00Qz0BWqBuvXCAVZHi3GpDvwCsmDUnGtkBv13vMnlkuPGnim4oo573QRWIOZBatQBfxPWnHwKKhEpxaQmlPXfc1OmxvHfr1GXa6fXRIAwRrzazGsgV4ZsTBAbLB4FExSSaPPvJDIBXIdc2cgAWv0SEd4/PLm+Nsr+7nwOANLfiTNUxcwTIGo7iBdbbBflwvfd+VPw8HbDV/0fGylUqawo/AiU895MuPd5jvwzrARIzA/IAmiILrI9U=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2019 10:09:15.4267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05927766-8a6c-4385-5c4e-08d74b0e68c4
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3720
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=1
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=893 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910070101
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2ZzhhRlr4o+nfr6dEHg8w6bxHM+TS6FEBwsWV3YAaA=;
 b=3BphAZFPS6YK9lXA/9NKolJdSTlrzuxTIu+xdEZL8RRCIzrF55HBLLq0by8mZWbtq2j8GlaW+IkDNg+tZzM09zs3P8JaFIXHh46i0In5aPrJNUW/MFoOu0HSsIR7D/CXBR9L5F6haL1RvOIqYLZBDPZRxTH3ioa3S2SwVSN9+hc=
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, rfontana@redhat.com,
 Laurent.pinchart@ideasonboard.com, tglx@linutronix.de, allison@lohutok.net,
 Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QURWNzUxMSBzdXBwb3J0IEkyUyBvciBTUERJRiBhcyBhdWRpbyBpbnB1dCBpbnRlcmZhY2VzLiBU
aGlzIGNvbW1pdAplbmFibGUgc3VwcG9ydCBmb3IgU1BESUYuCgpTaWduZWQtb2ZmLWJ5OiBCb2dk
YW4gVG9nb3JlYW4gPGJvZ2Rhbi50b2dvcmVhbkBhbmFsb2cuY29tPgotLS0KCkNoYW5nZXMgaW4g
djI6Ci0gYWRkIGZvcmdvdHRlbiBicmVhayBzdGF0ZW1lbnQKCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvYWR2NzUxMV9hdWRpby5jIHwgMTQgKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hZHY3NTExL2Fkdjc1MTFfYXVkaW8uYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2
NzUxMS9hZHY3NTExX2F1ZGlvLmMKaW5kZXggYTQyODE4NWJlMmMxLi4xZTliMTI4ZDIyOWIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2F1ZGlvLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfYXVkaW8uYwpAQCAt
MTE5LDYgKzExOSw5IEBAIGludCBhZHY3NTExX2hkbWlfaHdfcGFyYW1zKHN0cnVjdCBkZXZpY2Ug
KmRldiwgdm9pZCAqZGF0YSwKIAkJYXVkaW9fc291cmNlID0gQURWNzUxMV9BVURJT19TT1VSQ0Vf
STJTOwogCQlpMnNfZm9ybWF0ID0gQURWNzUxMV9JMlNfRk9STUFUX0xFRlRfSjsKIAkJYnJlYWs7
CisJY2FzZSBIRE1JX1NQRElGOgorCQlhdWRpb19zb3VyY2UgPSBBRFY3NTExX0FVRElPX1NPVVJD
RV9TUERJRjsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQpAQCAt
MTc1LDExICsxNzgsMjEgQEAgc3RhdGljIGludCBhdWRpb19zdGFydHVwKHN0cnVjdCBkZXZpY2Ug
KmRldiwgdm9pZCAqZGF0YSkKIAkvKiB1c2UgQXVkaW8gaW5mb2ZyYW1lIHVwZGF0ZWQgaW5mbyAq
LwogCXJlZ21hcF91cGRhdGVfYml0cyhhZHY3NTExLT5yZWdtYXAsIEFEVjc1MTFfUkVHX0dDKDEp
LAogCQkJCUJJVCg1KSwgMCk7CisJLyogZW5hYmxlIFNQRElGIHJlY2VpdmVyICovCisJaWYgKGFk
djc1MTEtPmF1ZGlvX3NvdXJjZSA9PSBBRFY3NTExX0FVRElPX1NPVVJDRV9TUERJRikKKwkJcmVn
bWFwX3VwZGF0ZV9iaXRzKGFkdjc1MTEtPnJlZ21hcCwgQURWNzUxMV9SRUdfQVVESU9fQ09ORklH
LAorCQkJCSAgIEJJVCg3KSwgQklUKDcpKTsKKwogCXJldHVybiAwOwogfQogCiBzdGF0aWMgdm9p
ZCBhdWRpb19zaHV0ZG93bihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpCiB7CisJc3Ry
dWN0IGFkdjc1MTEgKmFkdjc1MTEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKworCWlmIChhZHY3
NTExLT5hdWRpb19zb3VyY2UgPT0gQURWNzUxMV9BVURJT19TT1VSQ0VfU1BESUYpCisJCXJlZ21h
cF91cGRhdGVfYml0cyhhZHY3NTExLT5yZWdtYXAsIEFEVjc1MTFfUkVHX0FVRElPX0NPTkZJRywK
KwkJCQkgICBCSVQoNyksIDApOwogfQogCiBzdGF0aWMgaW50IGFkdjc1MTFfaGRtaV9pMnNfZ2V0
X2RhaV9pZChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKQEAgLTIxMyw2ICsy
MjYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkbWlfY29kZWNfcGRhdGEgY29kZWNfZGF0YSA9
IHsKIAkub3BzID0gJmFkdjc1MTFfY29kZWNfb3BzLAogCS5tYXhfaTJzX2NoYW5uZWxzID0gMiwK
IAkuaTJzID0gMSwKKwkuc3BkaWYgPSAxLAogfTsKIAogaW50IGFkdjc1MTFfYXVkaW9faW5pdChz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBhZHY3NTExICphZHY3NTExKQotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
