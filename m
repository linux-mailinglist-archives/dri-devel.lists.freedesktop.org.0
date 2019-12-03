Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6835D10FE06
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1065D6E4D7;
	Tue,  3 Dec 2019 12:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790C46E05C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:32:10 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3AE625026007; Tue, 3 Dec 2019 02:16:50 -0800
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2054.outbound.protection.outlook.com [104.47.45.54])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wkmvyursf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 02:16:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2b31cZGuS6NS58Kt3i7k54BSVFfV51EOZs3fc2otMS6gY1EOF/I3PSzAR6JeO5r7vRyVXxT+uf3PsBr+nOA7o1a1cKukOwARv3TzGfps99bxP/4hpas6Dl4SUQZZpBA/2Pp0PMwdwsGjNpSsTuUM7cNHjx9EClDMiZCYKrbqQKmi/kkDyYgniGXd5wbq76QVqA/wdRZYcP/nbzxXjXJB4304Ee00aIQFDm/KFC2cb2xzFWQZF14ohrYGlT1/sfE8/VlnZZYNX0r3YHf+0N/tqBXzrHBrbqhRH7N/l8XTSLiclZHeeIdkhMy+LhTm4v4F+BM3U8ZqOW0UfApdrCYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Amd4gy8WEtraNIADyXnnBCYaQbpNPaiXIlQzl2N91Zg=;
 b=DCBIjH8F7N41Mj/nW0ich9+FcN0gtu9GA6i+cSCe3QV+ieL5ESnSyKfaihaLBRi8R4JX9BhHdPkDPFA7x3zxcb23yqyQDMg6KOr0wjTZQgixyK6T0yn+EmnDrlQ5PZHrma7597ADUX+4AKh1xJC8zocaUAwXUR/10i6WA93XfIxhPvrFGNVkDWS8jMfxaSy+l1eYXC4AkmGMJGwPjeU8v8Tk+WokE0GMlt+5R809kOgmoGGuG/TsJ008WoRdpKSGkcZVy+FSye/KaKTkNUD/pH3NgthxmzPvM6ZYxy40ehJY6/s6sFNiwC5SAhueRLJrW2M4Jtkphd4/Rb52l3/l8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
Received: from DM5PR07CA0092.namprd07.prod.outlook.com (2603:10b6:4:ae::21) by
 DM6PR07MB6874.namprd07.prod.outlook.com (2603:10b6:5:1f1::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Tue, 3 Dec 2019 10:16:47 +0000
Received: from MW2NAM12FT061.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::205) by DM5PR07CA0092.outlook.office365.com
 (2603:10b6:4:ae::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Tue, 3 Dec 2019 10:16:47 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 MW2NAM12FT061.mail.protection.outlook.com (10.13.181.253) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:16:46 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB3AGg8h006738
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 3 Dec 2019 05:16:43 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 3 Dec 2019 11:16:41 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 11:16:41 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB3AGfQd001509;
 Tue, 3 Dec 2019 11:16:41 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB3AGfve001507;
 Tue, 3 Dec 2019 11:16:41 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 0/3] drm: Add support for Cadence MHDP DPI/DP bridge and
 J721E wrapper.
Date: Tue, 3 Dec 2019 11:16:03 +0100
Message-ID: <1575368166-861-1-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(36092001)(199004)(189003)(87636003)(26005)(336012)(48376002)(426003)(186003)(2616005)(478600001)(107886003)(26826003)(54906003)(19627235002)(70586007)(70206006)(42186006)(4326008)(51416003)(76130400001)(16586007)(316002)(50466002)(2906002)(5660300002)(356004)(6666004)(81156014)(8676002)(50226002)(305945005)(86362001)(8936002)(81166006)(2351001)(6916009)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB6874; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68ef27f2-d057-4596-ad0a-08d777d9e6e5
X-MS-TrafficTypeDiagnostic: DM6PR07MB6874:
X-Microsoft-Antispam-PRVS: <DM6PR07MB6874607D8112E99BE02F3F0FD2420@DM6PR07MB6874.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /oC0slDwp4vTvMe2yvaFsc8R9icHM0LPyys5/ayAKTuAYI83GLYihnzNNj80NszCMJCbejW2EQoLQywRSjULr3Th4AB0tD8CUIT6ua7Wy3oAjFFL1tswwva+4q8Oa7hGl1a8PcFIfBogKOye5ib14zzJaH1ynWfSJ3/mTweE/YN2PfIdFsodVhHloIyRQQUMoEUUHffGzaWRWQ3CN3bTxbWMecZsw+1R9yh3fnTnY9BZrm5W4dz7ZdUpdqSaW4ZA85x6CahiiMA3zV+BUiwTzMdqpAAXEgW9yEanN+CWcFmJZxgVMq7QVpzX1CMEsu/MK/cX6LpW1rEWkBEuys6s+hRCx+axpKgalZT53AYtvVU+0p2ldhDflzopi2LrrOBXjpjdgItE4f9K+HDZUq92COEXQibQyahcoFLJ0NrYHSDCqFSKjoviH3IWpEhQP9Wu
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:16:46.0203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ef27f2-d057-4596-ad0a-08d777d9e6e5
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6874
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_02:2019-11-29,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 suspectscore=1 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 mlxlogscore=947
 malwarescore=0 mlxscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912030082
X-Mailman-Approved-At: Tue, 03 Dec 2019 12:48:27 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=Amd4gy8WEtraNIADyXnnBCYaQbpNPaiXIlQzl2N91Zg=;
 b=C8xmBKKObMTMWY1otXJjn7D6fGYpNpIs3RIv7eWyPEw0bYgwnNaCyrClnvC2AJ6obacY
 i3RIzv2QNOi6lUgqLZMSJxqgnN5am9gAcl8sMwxkHwzIaGgayKQP/CnAYrAQ6KEE8UqI
 zPXMdopzoYDOj49njOXB8wPcsJl3w/bRj7xbcxvstMi4OOXTrDvR4ryyHHPI9xT0McE/
 fuwz86KzdaNPHk0WAMiqsbrYTx7qZZog+9eWjny21F+QVI18X3va8407URiOiipLzf/w
 p+YxyjrTL3iQy6GOMbngJi6xbjHaccUHVTZg/OGrl2eEPKfw4WN+9QKkse2uVKmbs292 SQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Amd4gy8WEtraNIADyXnnBCYaQbpNPaiXIlQzl2N91Zg=;
 b=kh2UlGtGpxPv3UTFcv4QVvyo3MKvkEJeldDUGaFCH0EgYFBbfp7UldoBmuknbEXA8mCQ6Ef6DuvUrMh7OOileDT6loLV9lcQZc6AeU/pdcpxeWnGSLltB/QY8F2bSnPf2fZBJUvJGIeFa1piC0bN5T20PNCDMlssjf98t8KHboU=
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBuZXcgRFJNIGRyaXZlciBmb3IgQ2FkZW5jZSBEaXNwbGF5
IFBvcnQuIFRoZSBDYWRlbmNlIERpc3BsYXkgUG9ydCAKaXMgYWxzbyByZWZlcnJlZCBhcyBNSERQ
IChNb2JpbGUgSGlnaCBEZWZpbml0aW9uIExpbmssIEhpZ2gtRGVmaW5pdGlvbiBNdWx0aW1lZGlh
IEludGVyZmFjZSAKRGlzcGxheSBQb3J0KSBDYWRlbmNlIERpc3BsYXkgUG9ydCBjb21wbGllcyB3
aXRoIFZFU0EgRGlzcGxheVBvcnQgKERQKSBhbmQgZW1iZWRkZWQgRGlzcGxheSAKUG9ydCAoZURQ
KSBzdGFuZGFyZHMgVGhpcyBkcml2ZXIgaW1wbGVtZW50cyBTaW5nbGUgU3RyZWFtIFRyYW5zcG9y
dCAoU1NUKSBzdXBwb3J0LiBBZGRzIFRleGFzIApJbnN0cnVtZW50cyBTb0MgSjcyMWUgc3BlY2lm
aWMgd3JhcHBlciBhbmQgYWRkcyB0aGUgZGV2aWNlIHRyZWUgYmluZGluZ3MgaW4gWUFNTCBmb3Jt
YXQKClRoZSBwYXRjaCBzZXJpZXMgaGFzIHRocmVlIHBhdGNoZXMgd2hpY2ggYXBwbGllcyB0aGUg
Y2hhbmdlcyBpbiB0aGUgYmVsb3cgc2VxdWVuY2UgCjEuIDAwMS1kdC1iaW5kaW5ncy1kcm0tYnJp
ZGdlLURvY3VtZW50LUNhZGVuY2UtTUhEUC1icmlkZ2UtYmluZGluZ3MtaW4teWFtbC1mb3JtYXQK
RG9jdW1lbnRzIHRoZSBiaW5kaW5ncyBpbiB5YW1sIGZvcm1hdC4KMi4gMDAyLWRybS1icmlkZ2Ut
QWRkLXN1cHBvcnQtZm9yLUNhZGVuY2UtTUhEUC1icmlkZ2UKVGhpcyBwYXRjaCBhZGRzIG5ldyBE
Uk0gZHJpdmVyIGZvciBDYWRlbmNlIE1IRFAgRGlzcGxheSBQb3J0LiBUaGUgcGF0Y2ggaW1wbGVt
ZW50cyBzdXBwb3J0cyAKZm9yIHNpbmdsZSBzdHJlYW0gdHJhbnNwb3J0IG1vZGUuCjMuIDAwMy1k
cm0tbWhkcC1hZGQtajcyMWUtd3JhcHBlcgpBZGQgVGV4YXMgSW5zdHJ1bWVudHMgKFRJKSBqNzIx
ZSB3cmFwcGVyIGZvciBtaGRwLiBUaGUgd3JhcHBlciBjb25maWd1cmVzIG1oZHAgY2xvY2tzIAph
bmQgbXV4ZXMgYXMgcmVxdWlyZWQgYnkgU29DLgoKWXV0aSBBbW9ua2FyICgzKToKICBkdC1iaW5k
aW5nczogZHJtL2JyaWRnZTogRG9jdW1lbnQgQ2FkZW5jZSBNSERQIGJyaWRnZSBiaW5kaW5ncyBp
biB5YW1sCiAgICBmb3JtYXQKICBkcm06IGJyaWRnZTogQWRkIHN1cHBvcnQgZm9yIENhZGVuY2Ug
TUhEUCBEUEkvRFAgYnJpZGdlCiAgZHJtL21oZHA6IGFkZCBqNzIxZSB3cmFwcGVyCgogLi4uL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2NkbnMsbWhkcC55YW1sICAgICAgICAgfCAgMTAxICsKIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgICAyMSAr
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAg
IDYgKwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLW1oZHAtajcyMWUuYyAgICAgICAgICAg
fCAgIDc5ICsKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1taGRwLWo3MjFlLmggICAgICAg
ICAgIHwgICA1NSArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NkbnMtbWhkcC5jICAgICAgICAg
ICAgICAgICB8IDIyNDMgKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvY2Rucy1taGRwLmggICAgICAgICAgICAgICAgIHwgIDM4MSArKysrCiA3IGZpbGVzIGNoYW5n
ZWQsIDI4ODYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9jZG5zLG1oZHAueWFtbAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1taGRwLWo3MjFlLmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NkbnMtbWhkcC1qNzIxZS5o
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLW1oZHAuYwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1taGRwLmgKCi0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
