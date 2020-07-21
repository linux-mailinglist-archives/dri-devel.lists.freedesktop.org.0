Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 062592280A0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5263C6E1F1;
	Tue, 21 Jul 2020 13:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED236E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 12:24:44 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id 83FE41A35C7;
 Tue, 21 Jul 2020 20:24:05 +0800 (CST)
Message-ID: <AMsAqwD5DbRmX6UN6RCXi4qz.1.1595334245532.Hmail.bernard@vivo.com>
To: sam@ravnborg.org, dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?ZHJtL3BhbmVsOiByZW1vdmUgcmV0dXJuIHZhbHVlIG9mIGZ1bmN0aW9uIGRybV9wYW5lbF9hZGQgd2hpY2ggYWx3YXlzIHJldHVybiB0cnVlLg==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 14.29.82.33
MIME-Version: 1.0
Received: from bernard@vivo.com( [14.29.82.33) ] by ajax-webmail ( [127.0.0.1]
 ) ; Tue, 21 Jul 2020 20:24:05 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Tue, 21 Jul 2020 20:24:05 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTR1PT0MYS0sdH05OVkpOQk5ISE9JT05NS0pVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo2CDoKDD9OPxkpFiNNLjVNKTgj
 Ek8KAVVKVUpOQk5ISE9JT05CTk5VMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWUpPVUlC
 VUNJVUhIWVdZCAFZQUlLT0M3Bg++
X-HM-Tid: 0a737154bca593b4kuws83fe41a35c7
X-Mailman-Approved-At: Tue, 21 Jul 2020 13:11:23 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi:

The function "int drm_panel_add(struct drm_panel *panel)" always returns true, this return value is meaningless.
So I am planning to optimize this function to a non-return implementation, "void drm_panel_add(struct drm_panel *panel)".

In order to achieve this optimization, I need to submit a patch series: 
First, modify the code of each submodule that depends on the return value of this function;
And last, replace the declaration in the drm_panel.h file and implementation in the drm_panel.c file;

Do you mind this optimization?
Looking forward to your reply and suggestions!

BR//Bernard





_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
