Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D627F2842
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414356EEB2;
	Thu,  7 Nov 2019 07:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4186E33C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 00:36:34 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA70Xe86142149
 for <dri-devel@lists.freedesktop.org>; Thu, 7 Nov 2019 00:36:33 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2w41w12hxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 00:36:33 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA70Xqne067611
 for <dri-devel@lists.freedesktop.org>; Thu, 7 Nov 2019 00:36:32 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2w41w8c5d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 00:36:32 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA70aVE9010885
 for <dri-devel@lists.freedesktop.org>; Thu, 7 Nov 2019 00:36:31 GMT
Received: from dhcp-10-154-154-96.vpn.oracle.com (/10.154.154.96)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Nov 2019 16:36:31 -0800
From: John Donnelly <john.p.donnelly@oracle.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Wed, 6 Nov 2019 18:36:30 -0600
Subject: Drm: mgag200. Video adapter issue with 5.4.0-rc3
Message-Id: <4EEB9CFB-2C48-4D02-82C8-6A300CF85831@oracle.com>
To: dri-devel@lists.freedesktop.org
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=5
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911070004
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=5 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911070004
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:43:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=from : content-type :
 content-transfer-encoding : mime-version : date : subject : message-id :
 to; s=corp-2019-08-05; bh=8xmN+pl1Hk/TjoRbWYI5R6lvPasQSkYYhe0k35ot3+k=;
 b=XgjmnOHRsCjtHxzqfYGBodYCcI6xUvDyzzO737BDpY0RRM+wsKrmZIV4MZU+5WInAqhd
 o538UhltOVMfDyLJ1RtWrAV4owC+Q1FdGk/3HBJKGA+wvCinLwqeou2Idy0C6lOsRABo
 E/6mhORpsOLk4+i3h8Ll57RKjWvy1HdJnw83s32Eyp86mxiYjsb7yDbZrDERPE18ABio
 dcTAofvDRY1oADLsCTsamMR+NkdBch3IXc2kIb2Wk02oUi8BK61fx5Tb20fWgF3WYjjL
 X2EKBhyP0dxiYioCrOsoRyGFFfx8nDDky667kKUA1dW2KyvwVLzYZUWAt98ggMEAABfC 9w== 
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

CkhpLAoKSSBhbSBpbnZlc3RpZ2F0aW5nIGFuIGlzc3VlIHdoZXJlIHdlIGxvc2UgdmlkZW8gYWN0
aXZpdHkgd2hlbiB0aGUgZGlzcGxheSBpcyBzd2l0Y2hlZCBmcm9tIGZyb20g4oCcdGV4dCBtb2Rl
4oCdIHRvIOKAnGdyYXBoaWMgbW9kZeKAnSAKb24gYSBudW1iZXIgb2YgIHNlcnZlcnMgdXNpbmcg
dGhpcyBkcml2ZXIuICAKClRoaXMgYWRhcHRlciBpcyAgU2VydmVyIEVuZ2luZXMgIGludGVncmF0
ZWQgUmVtb3RlIFZpZGVvIEFjY2VsZXJhdGlvbiBTdWJzeXN0ZW0gKFJWQVMpICAgaXMgdXNlZCBw
cmltYXJpbHkgYXMgcmVtb3RlIGNvbnNvbGUgLCBpTE8vRFJBQyBlbnZpcm9ubWVudHMuICAKCkkg
d2FzIHdvbmRlcmluZyBpZiBhbnlvbmUgIGNvdWxkIG9mZmVyIGFueSBzdWdnZXN0aW9ucyB3aGVy
ZSB0byBsb29rIGF0IC4gSSBkb27igJl0IHNlZSBhbnkgc3BlY2lmaWMgZXJyb3JzIGluIHRoZSBn
ZG0gbG9ncyBvciBtZXNzYWdlIGZpbGUgb3RoZXIgdGhhbiB0aGlzOgoKCm1nYWcyMDAgMDAwMDow
NDowMC4wOiByZW1vdmVfY29uZmxpY3RpbmdfcGNpX2ZyYW1lYnVmZmVyczogYmFyIDA6IDB4OWIw
MDAwMDAgLT4gMHg5YmZmZmZmZiAKbWdhZzIwMCAwMDAwOjA0OjAwLjA6IHJlbW92ZV9jb25mbGlj
dGluZ19wY2lfZnJhbWVidWZmZXJzOiBiYXIgMTogMHg5YzgxMDAwMCAtPiAweDljODEzZmZmIApt
Z2FnMjAwIDAwMDA6MDQ6MDAuMDogcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnM6
IGJhciAyOiAweDljMDAwMDAwIC0+IDB4OWM3ZmZmZmYgCmZiMDogc3dpdGNoaW5nIHRvIG1nYWcy
MDBkcm1mYiBmcm9tIEVGSSBWR0EgCm1nYWcyMDAgMDAwMDowNDowMC4wOiB2Z2FhcmI6IGRlYWN0
aXZhdGUgdmdhIGNvbnNvbGUgCmZiY29uOiBtZ2FnMjAwZHJtZmIgKGZiMCkgaXMgcHJpbWFyeSBk
ZXZpY2UgCm1nYWcyMDAgMDAwMDowNDowMC4wOiBmYjA6IG1nYWcyMDBkcm1mYiBmcmFtZSBidWZm
ZXIgZGV2aWNlIApbZHJtXSBJbml0aWFsaXplZCBtZ2FnMjAwIDEuMC4wIDIwMTEwNDE4IGZvciAw
MDAwOjA0OjAwLjAgb24gbWlub3IgMAoKVGhlIHN5c3RlbXMgd29ya2VkIGZpbmUgNC4xOCAga2Vy
bmVscyAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
