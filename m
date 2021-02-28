Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D959E327488
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 22:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62416E16D;
	Sun, 28 Feb 2021 21:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D966E16D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 21:10:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1614546624; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=NCX1BvortND0V29nOu4Tef/booradYZYhwQKXMOg5ljUAs5Cj4AOMmmwYZj7bJuJ1W
 Jib/rb0ybHfplgvX/IcD2RXlJSJLdXFjF/1KJVCrpqeCLBHDKfHcteA5p8xAvmJd/pfi
 sIZPb7LrTqkysgii+yZRMufbJMsKF/XcH030IYN2Dh0/N8pDRC4KG0DIxZnCd2q/jNfh
 A634osdEy9w7mRBWeIJK8XsRwWyemRYlvE3q3j0OiI4NWkpno0xNzce91pfSunLZnMqm
 097FXskbnFXzkVXeYA1w6/B8AEU82u6lu0XAV0IGynliL8VFt0DCj1UjGx3KeZOOdUIE
 L3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1614546624;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=1rqozWhERw2Mzsfqutmb+JRbzNkQ1UqtV2vcMBG6tMU=;
 b=QQlrG+yjQAIwgF4rGh9UHYDk+yK/hdNJpc3ynZZQ34IwytQ+TmSzudNY6ePnEre1H7
 V1RXx9oh1HPjRqqzS778XmfzciTGiBhwf5SPg+S6dWLwXXYmMvB2HXe8nTHiilhgS80+
 kvh8BxL8M3T8nDVYEiejaEjXZMTNUSPgAn6oEKq81uNX0BGF8OAlM8OASr4B/iUX3C1i
 gSCf0KPlbQOxhM0zbeEtU2+5/MVycTbHCTPEyhILxaW6H4EEYSPreD9itFf2GiZ1m3GD
 Rh04kVGKg4XNsQKT+bkUeXeTk0qqiHQLulvhUC1TXAVHkiKBT7OxMy7CY0dykkfjun+U
 CunQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1614546624;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=1rqozWhERw2Mzsfqutmb+JRbzNkQ1UqtV2vcMBG6tMU=;
 b=NWECPwaYIHWZfBq2eMJY4rjlhtjos7jbFHsZDhgJzmyI2QaSXM91f1yOfwmTEieOd+
 Me2X4uc+olgFjh5TI2z7CKXI4WYuAtaur3bk5kHcG3GyZ00H1OrTB/gsVMLwbPST2ZH7
 vVxQmh60bzxiZgDwXkHYvM0FlxtJveeAB/3e17F71S3mFJlAUjR3nmht195Qwb5bfrcM
 FS6xYoXBeb7E5BWa3nbRSeQDBPSfdIrmjXuJl2sPMkXj0jcvvaJJcnP2eE4aZ+3C6bZj
 WOi0BhWgDEktG+IQzyXHH2jIF7YGQny4et95A9rsXOiXGceq5NkYVbLqtGb/F0SF7vd+
 C6ag==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaeXA0Jn04="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.19.0 DYNA|AUTH)
 with ESMTPSA id L08d93x1SLANpOs
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 28 Feb 2021 22:10:23 +0100 (CET)
Subject: Q: What ist the standard way to define connector type and bus format
 with device tree?
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <F038EBE2-132E-4390-85E3-74AE9FB512A2@goldelico.com>
Date: Sun, 28 Feb 2021 22:10:23 +0100
Message-Id: <DCA66EAD-5403-4B0C-9194-F41C4783BD82@goldelico.com>
References: <CD0942AC-045E-41A2-A24F-F368C9438899@goldelico.com>
 <F038EBE2-132E-4390-85E3-74AE9FB512A2@goldelico.com>
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3124)
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Boddie <paul@boddie.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No expert available?

Let me refine the question:

By using the descriptions of panel-common.yaml and panel-timing.yaml it
is possible to define a simple-panel by pure DTS means.

This timing setup is done by code through:

git blame drivers/gpu/drm/panel/panel-simple.c | grep of_get_display_timing
4a1d0dbc8332231 (Sam Ravnborg            2020-02-16 19:15:13 +0100  431) 	ret = of_get_display_timing(np, "panel-timing", timing);
4a1d0dbc8332231 (Sam Ravnborg            2020-02-16 19:15:13 +0100  566) 		if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))

But it seems to lack a mechanism to define the connector type and bus format
which is needed to make a panel finally work.

Are we missing something or is the code/property missing?

If it is the first, please let us know so that we can use it.
If code is missing, please let us know so that we can suggest a patch.

BR and thanks,
Nikolaus


> Am 31.01.2021 um 11:54 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> 
> ping?
> 
>> Am 12.01.2021 um 12:41 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
>> 
>> Hi,
>> according to bindings/display/panel/panel-common.yaml
>> and by using "panel-simple" as compatible string we
>> can define almost all properties of a DSI panel by a
>> device tree entry.
>> 
>> Except the connector type and bus format which can only be
>> set by adding the information to the panel-simple tables.
>> 
>> This leads to big problems because DRM can't match the
>> display with any lcd controller. A smaller issue is a
>> warning:
>> 
>> [    0.313431] panel-simple claa070vc01: Specify missing connector_type
>> 
>> Are we missing some documentation or code that reads
>> some "connector-type" and "bus-format" property?
>> 
>> BR and thanks,
>> Nikolaus
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
