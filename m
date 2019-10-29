Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1727E8B01
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 15:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEE76E415;
	Tue, 29 Oct 2019 14:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473B16E415
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 14:41:16 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TEOOBw144858;
 Tue, 29 Oct 2019 14:41:12 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2vve3q9n13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 14:41:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TEOstE097919;
 Tue, 29 Oct 2019 14:41:12 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2vxpfd3nng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 14:41:12 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9TEfBcx003340;
 Tue, 29 Oct 2019 14:41:11 GMT
Received: from mwanda (/10.175.172.230)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 29 Oct 2019 07:41:10 -0700
Date: Tue, 29 Oct 2019 17:41:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: andrey.grodzovsky@amd.com
Subject: Re: [bug report] drm/sched: Set error to s_fence if HW job
 submission failed.
Message-ID: <20191029144105.GA19684@mwanda>
References: <20191029143914.GA19410@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029143914.GA19410@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=783
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910290140
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=866 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910290140
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=QbY1uNqPzM1UU28VzCXZawFhgKhARUP5lmyITM40YbQ=;
 b=FOXbH12i2outnmEJOa82ePEdiyPsO8VtMGFdobkEI/PeqSB+vVNlR/JbEVhltNp4nE2i
 NXZI2Wt7qjGhjZ6WPlcd05TmzaGvONdq7Aqacqw5u2vbUGGrt+qpUBUnK7qAwXa+4Wrg
 jwzOzLiElhc+zyRepY6eg0sflfXhHiOiQ4S4/6DEaKpgXxlHOYPTmicJwEMKA6rGG/Ky
 1pV0xT9qt32Si5G42G2P1LQyDPGcOaNVhiz31nQAVVLRwhp5MqDokwoMSadnMDAoSkFV
 TWQ0xT1mQ2zYR1J12kKdqPwKgtgf7JwkVOAy/hWNfvKXwTd9h/yp23E/lPHrKgM9DY3R dQ== 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBzZW50IHRoYXQgdG9vIHF1aWNrbHkuICBTZWUgYWxzbzoKCmRyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jOjc1MCBkcm1fc2NoZWRfbWFpbigpIHdhcm46IHBhc3NpbmcgemVy
byB0byAnUFRSX0VSUicKCndoaWNoIGlzIGEgZmV3IGxpbmVzIGxhdGVyLgoKcmVnYXJkcywKZGFu
IGNhcnBlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
