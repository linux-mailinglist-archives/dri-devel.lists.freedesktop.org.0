Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4D0FFC57
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 00:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA1589CA2;
	Sun, 17 Nov 2019 23:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CD66E02B
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 23:54:03 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAHNfspP010408
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 18:54:02 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2waym8wjtp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 18:54:02 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <sbobroff@linux.ibm.com>;
 Sun, 17 Nov 2019 23:54:00 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 17 Nov 2019 23:53:57 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAHNruW854001752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 17 Nov 2019 23:53:56 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB3515204E;
 Sun, 17 Nov 2019 23:53:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 679C052051;
 Sun, 17 Nov 2019 23:53:56 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E16D6A01EA;
 Mon, 18 Nov 2019 10:53:53 +1100 (AEDT)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] fix bad DMA from INTERRUPT_CNTL2
Date: Mon, 18 Nov 2019 10:53:52 +1100
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19111723-0016-0000-0000-000002C63ACF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111723-0017-0000-0000-00003327E876
Message-Id: <cover.1574034832.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-17_05:2019-11-15,2019-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911170227
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBjb3VwbGUgb2Ygbm90ZXM6Ci0gSW5pdGlhbCBkaXNjdXNzaW9uOgogIGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LU5vdmVtYmVyLzI0NDA5MC5o
dG1sCi0gSSBoYXZlIG9ubHkgdGVzdGVkIHRoZSBjYXNlIHRoYXQgdXNlcyByNjAwX2lycV9pbml0
KCksIGJ1dCB0aGV5IGFyZSBhbGwgdmVyeQogIHNpbWlsYXIuCgpDaGVlcnMsClNhbS4KClBhdGNo
IHNldCBjaGFuZ2Vsb2cgZm9sbG93czoKClBhdGNoIHNldCB2MjogClBhdGNoIDEvMjogZHJtL3Jh
ZGVvbjogZml4IGJhZCBETUEgZnJvbSBJTlRFUlJVUFRfQ05UTDIKLSBTcGxpdCBhbWRncHUgY2hh
bmdlcyBpbnRvIHNlcGFyYXRlIHBhdGNoLgpQYXRjaCAyLzIgKG5ldyBpbiB0aGlzIHZlcnNpb24p
OiBkcm0vYW1kZ3B1OiBmaXggYmFkIERNQSBmcm9tIElOVEVSUlVQVF9DTlRMMgoKUGF0Y2ggc2V0
IHYxOgpQYXRjaCAxLzE6IGRybS9yYWRlb24gZHJtL2FtZGdwdTogZml4IGJhZCBETUEgZnJvbSBJ
TlRFUlJVUFRfQ05UTDIKClNhbSBCb2Jyb2ZmICgyKToKICBkcm0vcmFkZW9uOiBmaXggYmFkIERN
QSBmcm9tIElOVEVSUlVQVF9DTlRMMgogIGRybS9hbWRncHU6IGZpeCBiYWQgRE1BIGZyb20gSU5U
RVJSVVBUX0NOVEwyCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfaWguYyB8IDMgKyst
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3I2MDAuYyAgICAgIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3NpLmMgICAgICAgIHwgNCArKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKCi0tIAoyLjIyLjAuMjE2LmcwMGEyYTk2ZmM5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
