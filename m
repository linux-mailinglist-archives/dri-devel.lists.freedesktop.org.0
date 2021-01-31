Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD82309BAF
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D686E29D;
	Sun, 31 Jan 2021 11:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F08C6E049
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 10:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612090474;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=W0NnNAnTTRHvU5q/pSan3yLVtC/jTxPWsuyVvRo5msA=;
 b=eGoSp412enk96x4WGFc9Nbfgi9xcskemUVMh3khFS842vr7sxflp29bFLeJKhhNyhm
 oSw19zbJ3Gkc8/MPFOY67QrNGOw3SiP0VX4C9gR10T+FoyRTa5VKZhf6mZE1agGQd6xb
 hNI+/YUBoUjga1o6dOOy5SiRe8l0ZYdBLX9rYMqFD5oJjV1DYRCfJQiGoHZuL56S+wHC
 HDfKjbuw1jRdgrM9jhd+oYx79yrYyB+Vi1PwUJK7IeFEN93ahmqWyy3HWqEc68bW3rCl
 xVFhatawAt9cKy2ajoojLIEIgpsPW/4IHKpHtUmeM2nAUXEDQeShoraoziJd/9P8Io8l
 fG6Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMkw43k+w=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.16.0 DYNA|AUTH)
 with ESMTPSA id R01a2bx0VAsICod
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 31 Jan 2021 11:54:18 +0100 (CET)
Subject: Re: [Letux-kernel] What ist the standard way to define connector type
 and bus format with device tree?
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CD0942AC-045E-41A2-A24F-F368C9438899@goldelico.com>
Date: Sun, 31 Jan 2021 11:54:18 +0100
Message-Id: <F038EBE2-132E-4390-85E3-74AE9FB512A2@goldelico.com>
References: <CD0942AC-045E-41A2-A24F-F368C9438899@goldelico.com>
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Sun, 31 Jan 2021 11:43:06 +0000
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

ping?

> Am 12.01.2021 um 12:41 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> 
> Hi,
> according to bindings/display/panel/panel-common.yaml
> and by using "panel-simple" as compatible string we
> can define almost all properties of a DSI panel by a
> device tree entry.
> 
> Except the connector type and bus format which can only be
> set by adding the information to the panel-simple tables.
> 
> This leads to big problems because DRM can't match the
> display with any lcd controller. A smaller issue is a
> warning:
> 
> [    0.313431] panel-simple claa070vc01: Specify missing connector_type
> 
> Are we missing some documentation or code that reads
> some "connector-type" and "bus-format" property?
> 
> BR and thanks,
> Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
