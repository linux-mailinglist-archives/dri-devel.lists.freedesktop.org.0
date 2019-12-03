Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1632610FE0C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E696E500;
	Tue,  3 Dec 2019 12:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BA96E03E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:34:43 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3ACDbM020547; Tue, 3 Dec 2019 02:14:21 -0800
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2051.outbound.protection.outlook.com [104.47.49.51])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wknv0uk8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 02:14:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvhV7uL218m9YWJIZ5Gch/DriEns7k2FwWRY+t5IKZMbyfZwbTB8fBQKUmZnJvCWPa87aupe3weW579kg50Mb6aS+pCUrBHRNFJYi3RPiYMj0HaSVH6aAgAUCm0yH2PBbJzjb5AxTsyabybPFpVrOOfHkg7KK20jngBlfDtkdL4f7JJhOeSRrPaIqAIID5hmvKQBLKX5LjhxszkOma4TQLvQ3XFYDo4C5E1Y7/7BBq2FFLtZtzBYLS4NCjvfCObF0P/73D/IzVtB3sew/+XsHNucldTFdYjtGrWP8qSw6MXRnX0j/n0EHZylncVl/M2usX6mYnxRuFOcOEj57s+2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qM04rEFsenirLh74KllyuPLCWict7VdX6tQXEHlgIbc=;
 b=Z4AjExP1Z+BkZzNznHIOz+LsJULVsj2G3REBLXV59IkoepDG7l9FGYUIMxaDOWpdTeoNIPzCCtXly4TTR77/1dFOAhjBeGlwGp+lr1k/ZUNQGqi+CcOS8HSHaKgTPFqO6Rc0fGQodfPfcTlq6LHnGXKeVo9YpZljhthRuVu3KL813B0xCXwgiPRuEUlrRonB9q8yaDOJf6I/QcLFtspBFEqgmpIP1gyzjPyjthCRI4QHPldcyN4oN/+NbiFhOvTqpQpaZYpRvE3j95gazzTtGwok2ZvZNTJHytP4N8LZZtrBt6fp4Pg68/T06unYKNDhdMi2dtqs94aTt3uBmi9WKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
Received: from SN4PR0701CA0024.namprd07.prod.outlook.com
 (2603:10b6:803:28::34) by CO2PR07MB2534.namprd07.prod.outlook.com
 (2603:10b6:102:13::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Tue, 3 Dec
 2019 10:14:15 +0000
Received: from MW2NAM12FT042.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::200) by SN4PR0701CA0024.outlook.office365.com
 (2603:10b6:803:28::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20 via Frontend
 Transport; Tue, 3 Dec 2019 10:14:15 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 MW2NAM12FT042.mail.protection.outlook.com (10.13.180.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:14:15 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB3AE7sv027708
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 3 Dec 2019 02:14:14 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 3 Dec 2019 11:14:08 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 11:14:08 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB3AE8Qr030926;
 Tue, 3 Dec 2019 11:14:08 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB3AE8bL030924;
 Tue, 3 Dec 2019 11:14:08 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 08/15] dt-bindings: phy: phy-cadence-torrent: Add clock
 bindings
Date: Tue, 3 Dec 2019 11:13:18 +0100
Message-ID: <1575368005-29797-9-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(189003)(199004)(36092001)(4326008)(26826003)(2351001)(107886003)(87636003)(478600001)(8936002)(6916009)(2906002)(305945005)(16586007)(42186006)(5660300002)(54906003)(7636002)(36756003)(316002)(76130400001)(70206006)(86362001)(6666004)(48376002)(356004)(50466002)(426003)(446003)(11346002)(246002)(336012)(2616005)(76176011)(26005)(186003)(51416003)(50226002)(8676002)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR07MB2534; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 373b623d-f56e-45e1-51dc-08d777d98cdb
X-MS-TrafficTypeDiagnostic: CO2PR07MB2534:
X-Microsoft-Antispam-PRVS: <CO2PR07MB2534A8D8D4E8E584AD4123ADD2420@CO2PR07MB2534.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uf++V0x5drFLZMkaLcBZHbGhsbqiWI9ArNYjjUapnIxiyEaCt+h60+tQ2wphBwQG3CgoQo5s+axUFmfeJb+xr1J8ySMfP0k3JDZtRWzOUneOevi6CrNiI9xAxp7Yl0bef9TPwUkI1OYYY2gJgQsoeGZALT2ZNgm/Ky/im7BmuFYPU6pZn8lOtszTH880yciHxMbc6XUN95tzcb0nmSjjknWPdogEvI844kd+Xi+30FHa3txVhlzpxqYMXpkg94j3bS8+mA4GxLuJH0RBhwymOB1nAfRGDVB4TnM34OE2l8Txtx9nqOf8c+QHKT0jhPlYqb290Q6knMBD3vJDmXdmteMuQTWJjJB8UZ20181sRLTMVXqqwXVHgrBZPRSJqbWxZxDiEc4GCUSDsaprSd0hKaFByoGIAQKFKWgIFKmGBlmXkCLDVI7XCaQ/yIJjdZ4Cg/zBu6LPI3nlQ9x/rjtJZw==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:14:15.0486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 373b623d-f56e-45e1-51dc-08d777d98cdb
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR07MB2534
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_02:2019-11-29,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 spamscore=0 suspectscore=1 clxscore=1015 mlxlogscore=999 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912030082
X-Mailman-Approved-At: Tue, 03 Dec 2019 12:48:27 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=qM04rEFsenirLh74KllyuPLCWict7VdX6tQXEHlgIbc=;
 b=a7A/9IygOUSbCqeRKo/niQptZylSSvcet1aglVfBFcMYMlQzWcdZ0bYZIhNVri24HteL
 sQ9MQUbhREJ8NBOFHkydWdQLW1CaQXgNkns7DiWKHS4aY2m9idfgByNg8a+6zKFnqQC9
 mnld87747ugTaC/fyeQVN0Q7CmYxcDlvB40BjXt01mCr/h9T2iM6RgrltxbxT59i1YxT
 feGn2NSxiPtbU0ccp9yvswz33MFDgR9f5UUWJBWYvdqmGgth40+BAbBwQ5gJQcg98vfN
 hSw8sul0Q4Gp2LHzTGKbq+MWM7jXQrG5E25hvEMXPhC5yfkWqREeOpsKlVxAdHh0F0X/ bg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qM04rEFsenirLh74KllyuPLCWict7VdX6tQXEHlgIbc=;
 b=k8dUh6sl3k310nvkk5199teqkc/Z7NJW5wkbpV+00GVXLdVr34ASw7A/dNZ7YOHHsrAid/+0D58Iy0LDuPTdhh4B5qxp/dGwE8XVrkeTroG2l7o/meAlgXT4jGkPXhnSpDpYkxvojtauHPT0YNnc/1pg1W7KfSf8477hPw/peAg=
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
Cc: mparab@cadence.com, yamonkar@cadence.com, praneeth@ti.com,
 dkangude@cadence.com, jsarha@ti.com, kishon@ti.com, tomi.valkeinen@ti.com,
 sjakhade@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIFRvcnJlbnQgUEhZIHJlZmVyZW5jZSBjbG9jayBiaW5kaW5ncy4KClNpZ25lZC1vZmYtYnk6
IFl1dGkgQW1vbmthciA8eWFtb25rYXJAY2FkZW5jZS5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvcGh5L3BoeS1jYWRlbmNlLXRvcnJlbnQueWFtbCAgICAgICAgIHwgMTIgKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LWNhZGVuY2UtdG9ycmVudC55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9waHktY2FkZW5jZS10
b3JyZW50LnlhbWwKaW5kZXggZDAwMzdiYy4uNmUxZDcxZTUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LWNhZGVuY2UtdG9ycmVudC55YW1sCisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LWNhZGVuY2UtdG9y
cmVudC55YW1sCkBAIC0xNiw2ICsxNiwxNCBAQCBwcm9wZXJ0aWVzOgogICBjb21wYXRpYmxlOgog
ICAgIGNvbnN0OiBjZG5zLHRvcnJlbnQtcGh5CiAKKyAgY2xvY2tzOgorICAgIG1heEl0ZW1zOiAx
CisgICAgZGVzY3JpcHRpb246CisgICAgICBQSFkgcmVmZXJlbmNlIGNsb2NrLiBNdXN0IGNvbnRh
aW4gYW4gZW50cnkgaW4gY2xvY2stbmFtZXMuCisKKyAgY2xvY2stbmFtZXM6CisgICAgY29uc3Q6
ICJyZWZjbGsiCisKICAgcmVnOgogICAgIGl0ZW1zOgogICAgICAgLSBkZXNjcmlwdGlvbjogT2Zm
c2V0IG9mIHRoZSBEUFRYIFBIWSBjb25maWd1cmF0aW9uIHJlZ2lzdGVycy4KQEAgLTM2LDYgKzQ0
LDggQEAgcHJvcGVydGllczoKIAogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJsZQorICAtIGNsb2Nr
cworICAtIGNsb2NrLW5hbWVzCiAgIC0gcmVnCiAgIC0gIiNwaHktY2VsbHMiCiAKQEAgLTQ4LDUg
KzU4LDcgQEAgZXhhbXBsZXM6CiAgICAgICAgICAgbnVtX2xhbmVzID0gPDQ+OwogICAgICAgICAg
IG1heF9iaXRfcmF0ZSA9IDw4MTAwPjsKICAgICAgICAgICAjcGh5LWNlbGxzID0gPDA+OworICAg
ICAgICAgIGNsb2NrcyA9IDwmcmVmX2Nsaz47CisgICAgICAgICAgY2xvY2stbmFtZXMgPSAicmVm
Y2xrIjsKICAgICB9OwogLi4uCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
