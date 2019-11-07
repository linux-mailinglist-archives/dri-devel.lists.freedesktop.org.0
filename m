Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFCEF256A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 03:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322A36EE72;
	Thu,  7 Nov 2019 02:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2E46EE70
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 02:29:31 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA72TUdv028601
 for <dri-devel@lists.freedesktop.org>; Thu, 7 Nov 2019 02:29:30 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2w41w12vwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 02:29:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA72NEo4088093
 for <dri-devel@lists.freedesktop.org>; Thu, 7 Nov 2019 02:29:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2w41w8hyj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 02:29:30 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA72TTYJ010994
 for <dri-devel@lists.freedesktop.org>; Thu, 7 Nov 2019 02:29:29 GMT
Received: from dhcp-10-154-154-96.vpn.oracle.com (/10.154.154.96)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Nov 2019 18:29:29 -0800
From: John Donnelly <john.p.donnelly@oracle.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Wed, 6 Nov 2019 20:29:27 -0600
Subject: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics 
Message-Id: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
To: dri-devel@lists.freedesktop.org
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=5
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911070024
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=5 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911070025
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=from : content-type :
 content-transfer-encoding : mime-version : date : subject : message-id :
 to; s=corp-2019-08-05; bh=8/0blrl9kW3af6OF87bbHv14cOZ84vwRT5/lAymN0hc=;
 b=LSpZXg2Pf3fXd+8SHMfximWdad/G0TXE+IwozZGDvZ99QzZfUIQuHr8NBBsFvYHJhivE
 ymkaigMRAGSdLMqYrIM24bADi8+PVqWMDCFVDMmpeLFoXQaoQKIMnMbCFNOzxylLEcML
 pJxjkhFYytRVGu1Yeh8YBfLXINppFy9rTgXiUnqSzwWov/QbzUlRrildx6PJPzW4UnXL
 FBuBECFF4ZjtVMtwQvJN76jVJ0aJSyHCb7X5MmbAUWhhEFgyhboddIKRuG9XxwY8/zfz
 Ffo2S+/SSfHmy4aIE99lXbE/axTlP4lXNRux0PxtDINc3ava13AGht/mXJrhlcNb3CKL kQ== 
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

SGksCgpJIGFtIGludmVzdGlnYXRpbmcgYW4gaXNzdWUgd2hlcmUgd2UgbG9zZSB2aWRlbyBhY3Rp
dml0eSB3aGVuIHRoZSBkaXNwbGF5IGlzIHN3aXRjaGVkIGZyb20gZnJvbSDigJx0ZXh0IG1vZGXi
gJ0gdG8g4oCcZ3JhcGhpYyBtb2Rl4oCdIApvbiBhIG51bWJlciBvZiAgc2VydmVycyB1c2luZyB0
aGlzIGRyaXZlci4gICAgU3BlY2lmaWNhbGx5ICBzdGFydGluZyB0aGUgR05PTUUgZGVza3RvcC4g
CgpUaGlzIGFkYXB0ZXIgaXMgIFNlcnZlciBFbmdpbmVzICBJbnRlZ3JhdGVkIFJlbW90ZSBWaWRl
byBBY2NlbGVyYXRpb24gU3Vic3lzdGVtIChSVkFTKSAgYW5kIGlzIHVzZWQgYXMgcmVtb3RlIGNv
bnNvbGUgaW4gaUxPL0RSQUMgZW52aXJvbm1lbnRzLiAgCgpJIGRvbuKAmXQgc2VlIGFueSBzcGVj
aWZpYyBlcnJvcnMgaW4gdGhlIGdkbSBsb2dzIG9yIG1lc3NhZ2UgZmlsZSBvdGhlciB0aGFuIHRo
aXM6CgoKbWdhZzIwMCAwMDAwOjA0OjAwLjA6IHJlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVi
dWZmZXJzOiBiYXIgMDogMHg5YjAwMDAwMCAtPiAweDliZmZmZmZmIAptZ2FnMjAwIDAwMDA6MDQ6
MDAuMDogcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnM6IGJhciAxOiAweDljODEw
MDAwIC0+IDB4OWM4MTNmZmYgCm1nYWcyMDAgMDAwMDowNDowMC4wOiByZW1vdmVfY29uZmxpY3Rp
bmdfcGNpX2ZyYW1lYnVmZmVyczogYmFyIDI6IDB4OWMwMDAwMDAgLT4gMHg5YzdmZmZmZiAKCmZi
MDogc3dpdGNoaW5nIHRvIG1nYWcyMDBkcm1mYiBmcm9tIEVGSSBWR0EgCm1nYWcyMDAgMDAwMDow
NDowMC4wOiB2Z2FhcmI6IGRlYWN0aXZhdGUgdmdhIGNvbnNvbGUgCmZiY29uOiBtZ2FnMjAwZHJt
ZmIgKGZiMCkgaXMgcHJpbWFyeSBkZXZpY2UgCm1nYWcyMDAgMDAwMDowNDowMC4wOiBmYjA6IG1n
YWcyMDBkcm1mYiBmcmFtZSBidWZmZXIgZGV2aWNlIApbZHJtXSBJbml0aWFsaXplZCBtZ2FnMjAw
IDEuMC4wIDIwMTEwNDE4IGZvciAwMDAwOjA0OjAwLjAgb24gbWlub3IgMAoKVGhlIHN5c3RlbXMg
d29ya2VkIGZpbmUgd2l0aCAgNC4xOCAga2VybmVscyAgYW5kIGEgcmVjZW50IExpbnV4ICA1LjIu
MTggOyAgVGhlIHN5bXB0b20gZmlyc3QgYXBwZWFycyBpbiA1LjMuNi4gYW5kIG9ud2FyZC4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
