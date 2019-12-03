Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0A310FE07
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789786E4E3;
	Tue,  3 Dec 2019 12:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 749 seconds by postgrey-1.36 at gabe;
 Tue, 03 Dec 2019 10:26:44 UTC
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3F989DA4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:26:44 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3ACEa3020558; Tue, 3 Dec 2019 02:16:50 -0800
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2056.outbound.protection.outlook.com [104.47.45.56])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wknv0ukg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 02:16:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a05qw2WruZbM4UgHBHVGMt9VdBbhb0r91az/KxAwhj49IRxkqYtWaVzmlUTMRNCzb9ufCIquK5Kka/It41xbpfDyc7m6BjUTxXRk69RM/vfI1+DMUMLeBvVmWwiBBFaGFMouXVfTvHNDuIVsFhVDBiB5X0Reh+kmnTcRtZeWlOsiP68jiEw6CT8uaWO4r4XECQb8+MrIMXptNj98sBU7nOvUOYvmVgNeHm7S8xJUxwZfkpSzURxcYRHVSmIV9myNyo68VjcQfdz3NEu1g+A9oelXQkvV1gEsV2MqF4120N2SWN0H3uk6WDbJYM6otw1qnYa4uZrzHu01CJ77td1hGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95WMsevK821WX+DVl3PlleYz5SjHAZjuq5p211SDZ/k=;
 b=eGL7Is6l9AinCT6z/TY0PYT7dwxqxxyjls/1WbdZo7t3csg0E845PkRLQ7OeqKtihTbiP8nFcaRVb6Lppp1T9YF666IE2+PAgiZIb5S+O/jW+tLR5Fdfu7w03yXccxd2orqjoeldHb7dtbj6jak0VwxsXutRluQHwe9BEO2AzYMkv7DhHDdVljBZ9bAqRvyBTANB7I+R8FG1plWTjYv7fv3cWvOmauuOA3zpxx+ahxChggD7TArRhlWK2QXy6zd+gmSrf2t5pYRqyBoGO2ib/5Nl6fH6qSv5TeqWwd2ETnNtAYRf4K6gM6zWQYMimwcqwoBPgwqMVJ2uSH3kbgpD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
Received: from CH2PR07CA0035.namprd07.prod.outlook.com (2603:10b6:610:20::48)
 by DM6PR07MB7178.namprd07.prod.outlook.com (2603:10b6:5:1e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20; Tue, 3 Dec
 2019 10:16:48 +0000
Received: from MW2NAM12FT030.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::205) by CH2PR07CA0035.outlook.office365.com
 (2603:10b6:610:20::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.19 via Frontend
 Transport; Tue, 3 Dec 2019 10:16:47 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 MW2NAM12FT030.mail.protection.outlook.com (10.13.181.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:16:47 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB3AGg8i006738
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 3 Dec 2019 05:16:45 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 3 Dec 2019 11:16:42 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 11:16:42 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB3AGf55001525;
 Tue, 3 Dec 2019 11:16:41 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB3AGfoM001517;
 Tue, 3 Dec 2019 11:16:41 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 1/3] dt-bindings: drm/bridge: Document Cadence MHDP bridge
 bindings in yaml format
Date: Tue, 3 Dec 2019 11:16:04 +0100
Message-ID: <1575368166-861-2-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1575368166-861-1-git-send-email-yamonkar@cadence.com>
References: <1575368166-861-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(36092001)(189003)(199004)(8936002)(2906002)(42186006)(107886003)(87636003)(4326008)(316002)(16586007)(305945005)(356004)(81166006)(6666004)(54906003)(26005)(2351001)(336012)(81156014)(8676002)(2616005)(426003)(446003)(11346002)(478600001)(6916009)(50466002)(26826003)(86362001)(48376002)(76176011)(70586007)(51416003)(186003)(50226002)(36756003)(5660300002)(6306002)(76130400001)(70206006)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB7178; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 095bcc30-7807-4221-e16a-08d777d9e790
X-MS-TrafficTypeDiagnostic: DM6PR07MB7178:
X-Microsoft-Antispam-PRVS: <DM6PR07MB71784A6ED6B21F53F7FA19E2D2420@DM6PR07MB7178.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JwSAgyumdnYS1/ctOLqqD2K5yvjSca3RjkQQroStyAmTBcc22ZyuvPFa0tbSw6fYPIq1tym24WWz1CaESL3HDT4QKVVvdwExQIrceOB+NL8J+RZ8ADne4O7r3NFfpdh//eP0yvSPJkby6oKD0c3AjIyb2eNQFgEvlXrP20QAP1AAh6e9732QNhq2Qt4OUSiNZlOQheIRxcrbYDHqRtHstDEqbFNh6murrYXTE00mRVw7rsaSiOhCi6n++/R1W2gC+8XpZoD4dDpFH/rOX4/z+xZ/kw4DCHBwD/PiK7Py48HX+Vw6U/jaYlZiJYzvP13o2v4vwYSYNsvblhyEaDeeIVVv6X3LI1JNsRx371t5ijdpXLcAbOMZjGOkFQS4p6cd+ATQW/bxp6DufR5mRmGlc+LOLFq2hOSXSLwOMK3tsLQr9cUjJNeDRJVeI+m9AQ2Pf/uOrZ14J66XS1z1fKLoggSyr1lB1oV7vuGfsNnZP3w=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:16:47.1423 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 095bcc30-7807-4221-e16a-08d777d9e790
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB7178
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
 bh=95WMsevK821WX+DVl3PlleYz5SjHAZjuq5p211SDZ/k=;
 b=Yl0sKOTgVlEdqOEduHOOiBDQedZgo6eJg6N/xAGa7OiGIwe/7Q3x7LoLDPsUQZEEJCZs
 bSsrPC+0pQO6wmO4gSLUowWlKU7ANXdAaSmJZwNLy2DxDs0oaDF6V/qR/m4yPIQPzyZm
 L99i2BBjxLlYYJtuWpx/UMoq5HkWPEi89J3PBpADbR+5Mn8GcQfY+FDVzP+/LZyjHQex
 AnrvHrE6D0/fnlqJLxAMnRQ5E4UMeRfPGXd5KPw0Wgjye6bp0u7ILBAQfkHgi4EMznh0
 qwTpgLTT78ju86q6qrW1Ar1vcV3NMfwoZ84Ala4Cw3Dzi0lGLAVkKO8JADdvBDXXAaAQ +A== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95WMsevK821WX+DVl3PlleYz5SjHAZjuq5p211SDZ/k=;
 b=2dLgG/KXZ+hyLaP2C/FnfUILIyTSgos9d/dBTTNt37iorza2cGi8IqvCqlJCfMYUNQpRdzjP2n4zsCQcrmR5ZhxFg9YIOvBmcCXBUGAsN6xU/wAHtYCvib5qiKwx0vYeKojWQOKDaSWy0kM84dceyK8H53Y9r6oc3yFXIKxd2pY=
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
 dkangude@cadence.com, jsarha@ti.com, tomi.valkeinen@ti.com,
 sjakhade@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9jdW1lbnQgdGhlIGJpbmRpbmdzIHVzZWQgZm9yIHRoZSBDYWRlbmNlIE1IRFAgRFBJL0RQIGJy
aWRnZSBpbgp5YW1sIGZvcm1hdC4KClNpZ25lZC1vZmYtYnk6IFl1dGkgQW1vbmthciA8eWFtb25r
YXJAY2FkZW5jZS5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2NkbnMsbWhk
cC55YW1sICAgICAgICAgfCAxMDEgKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTAxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvY2RucyxtaGRwLnlhbWwKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvY2Ru
cyxtaGRwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvY2RucyxtaGRwLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4u
MTczOWYyZQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9jZG5zLG1oZHAueWFtbApAQCAtMCwwICsxLDEwMSBAQAorJVlB
TUwgMS4yCistLS0KKyRpZDogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkv
YnJpZGdlL2NkbnMsbWhkcC55YW1sIyIKKyRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMiCisKK3RpdGxlOiBDYWRlbmNlIE1IRFAgYnJpZGdlCisK
K21haW50YWluZXJzOgorICAtIFN3YXBuaWwgSmFraGFkZSA8c2pha2hhZGVAY2FkZW5jZS5jb20+
CisgIC0gWXV0aSBBbW9ua2FyIDx5YW1vbmthckBjYWRlbmNlLmNvbT4KKworcHJvcGVydGllczoK
KyAgY29tcGF0aWJsZToKKyAgICBpdGVtczoKKyAgICAgIC0gY29uc3Q6IHRpLGo3MjFlLW1oZHA4
NTQ2CisgICAgICAtIGNvbnN0OiBjZG5zLG1oZHA4NTQ2CisKKyAgY2xvY2tzOgorICAgIGl0ZW1z
OgorICAgICAgZGVzY3JwdGlvbjoKKyAgICAgICAgRFAgYnJpZGdlIGNsb2NrLCBpdCdzIHVzZWQg
YnkgdGhlIElQIHRvIGtub3cgaG93IHRvIHRyYW5zbGF0ZSBhIG51bWJlciBvZgorICAgICAgICBj
bG9jayBjeWNsZXMgaW50byBhIHRpbWUgKHdoaWNoIGlzIHVzZWQgdG8gY29tcGx5IHdpdGggRFAg
c3RhbmRhcmQgdGltaW5ncworICAgICAgICBhbmQgZGVsYXlzKS4KKworICByZWc6CisgICAgaXRl
bXM6CisgICAgICAtIGRlc2NyaXB0aW9uOgorICAgICAgICAgIFJlZ2lzdGVyIGJsb2NrIG9mIG1o
ZHB0eCBhYnAgcmVnaXN0ZXJzIHVwdG8gUEhZIG1hcHBlZCBhcmVhKEFVWF9DT05GSUdfUCkuCisg
ICAgICAgICAgVGhlIEFVWCBhbmQgUE1BIHJlZ2lzdGVycyBhcmUgbWFwcGVkIHRvIGFzc29jaWF0
ZWQgcGh5IGRyaXZlci4KKyAgICAgIC0gZGVzY3JpcHRpb246CisgICAgICAgICAgUmVnaXN0ZXIg
YmxvY2sgZm9yIERTU19FRFAwX0lOVEdfQ0ZHX1ZQIHJlZ2lzdGVycyBpbiBjYXNlIG9mIFRJIEo3
IFNvQ3MuCisKKyAgcGh5czoKKyAgICBkZXNjcmlwdGlvbjogc2VlIHRoZSBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3BoeS1jYWRlbmNlLXRvcnJlbnQueWFtbAorCisgIHBo
eS1uYW1lczoKKyAgICBjb25zdDogZHBwaHkKKworICBpbnRlcnJ1cHRzOgorICAgIG1heEl0ZW1z
OiAxCisKKyAgcG93ZXItZG9tYWluczoKKyAgICBtYXhJdGVtczogMQorICAgIGRlc2NyaXB0aW9u
OiBwaGFuZGxlIHRvIHRoZSBhc3NvY2lhdGVkIHBvd2VyIGRvbWFpbgorCisgIHBvcnRzOgorICAg
IHR5cGU6IG9iamVjdAorICAgIGRlc2NyaXB0aW9uOgorICAgICAgUG9ydHMgYXMgZGVzY3JpYmVk
IGluIERvY3VtZW50YXRpb24vZGV2aWN0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dAorICAgIHByb3Bl
cnRpZXM6CisgICAgICAgcG9ydEAwOgorICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAg
IGlucHV0IHBvcnQgcmVwcmVzZW50aW5nIHRoZSBEUCBicmlkZ2UgaW5wdXQKKworICAgICAgIHBv
cnRAMToKKyAgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICBvdXRwdXQgcG9ydCByZXBy
ZXNlbnRpbmcgdGhlIERQIGJyaWRnZSBvdXRwdXQKKyAgICByZXF1aXJlZDoKKyAgICAgIC0gcG9y
dEAwCisgICAgICAtIHBvcnRAMQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gY2xv
Y2tzCisgIC0gcmVnCisgIC0gcGh5cworICAtIHBoeS1uYW1lcworICAtIHBvcnRzCisKK2FkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgbWhkcDogZHAt
YnJpZGdlQGYwZmIwMDAwMDAgeworICAgICAgICBjb21wYXRpYmxlID0gInRpLGo3MjFlLW1oZHA4
NTQ2IiwgImNkbnMsbWhkcDg1NDYiOworICAgICAgICByZWcgPSA8MHhmMCAweGZiMDAwMDAwIDB4
MCAweDEwMDAwMDA+LAorICAgICAgICAgICAgICA8MHhmMCAweGZjMDAwMDAwIDB4MCAweDIwMDAw
MDA+OworICAgICAgICBjbG9ja3MgPSA8Jm1oZHBfY2xvY2s+OworICAgICAgICBwaHlzID0gPCZk
cF9waHk+OworICAgICAgICBwaHktbmFtZXMgPSAiZHBwaHkiOworCisgICAgICAgIHBvcnRzIHsK
KyAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICAgICAgICNzaXpl
LWNlbGxzID0gPDA+OworCisgICAgICAgICAgICAgIHBvcnRAMCB7CisgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MD47CisgICAgICAgICAgICAgICAgICAgICBkcF9icmlkZ2VfaW5wdXQ6IGVu
ZHBvaW50IHsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVtb3RlLWVuZHBvaW50ID0gPCZ4eHhfZHBpX291dHB1dD47CisgICAgICAgICAgICAgICAgICAg
ICB9OworICAgICAgICAgICAgICB9OworCisgICAgICAgICAgICAgIHBvcnRAMSB7CisgICAgICAg
ICAgICAgICAgICAgICByZWcgPSA8MT47CisgICAgICAgICAgICAgICAgICAgICBkcF9icmlkZ2Vf
b3V0cHV0OiBlbmRwb2ludCB7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVtb3RlLWVuZHBvaW50ID0gPCZ4eHhfZHBfY29ubmVjdG9yX2lucHV0PjsKKyAgICAgICAgICAg
ICAgICAgICAgIH07CisgICAgICAgICAgICAgIH07CisgICAgICB9OworICAgIH07CisuLi4KLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
