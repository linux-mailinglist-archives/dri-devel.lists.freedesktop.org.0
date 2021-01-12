Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDFE2F4629
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACF36E10D;
	Wed, 13 Jan 2021 08:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB2589690
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 11:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610451712;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:Message-Id:Cc:Date:From:Subject:From:Subject:Sender;
 bh=EpwVukQQ+OYL/SNYIYJknXafUxWYO+RYpZDfwGwh/2o=;
 b=I4QDxp4xQmnGK0uEAboLtizkvfZ10bpdRTH5/lUAcSswAtXhb6o06s94DK946sSsnT
 uT0CdxckLjZoWZzgqwOrRpCkCpcAvhMui+ytzOJ250ZUw5GAkYOcJtMT0D9vqZAQJhxU
 JgwCEbrEPM28L4qLiobp+rbz0cXeLzplJ+YHzUquSxtzEYie7ZDpm3G8j/CKwmQoKf0t
 adZ2+mZsb6ARLuLFqeehKIupvxPGuP7E4hGu0ayOA4biEWR9pHjx1Isreq87xWk6FTBY
 Xl+ibcclz59oNxo8KxvfeSY76QPBmwhXNN0n/maR5l3xr9GC6fpmIFYdNcSvJU8LASt1
 6Rqw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSUXA0MbAo="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id m056b3x0CBfaU0W
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 12 Jan 2021 12:41:36 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: What ist the standard way to define connector type and bus format
 with device tree?
From: "H. Nikolaus Schaller" <hns@goldelico.com>
Date: Tue, 12 Jan 2021 12:41:36 +0100
Message-Id: <CD0942AC-045E-41A2-A24F-F368C9438899@goldelico.com>
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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

Hi,
according to bindings/display/panel/panel-common.yaml
and by using "panel-simple" as compatible string we
can define almost all properties of a DSI panel by a
device tree entry.

Except the connector and bus format which can only be
set by adding the same information to the panel-simple tables.

This leads to big problems because DRM can't match the
display with any lcd controller. The least issue is a
warning:

[    0.313431] panel-simple claa070vc01: Specify missing connector_type

Are we missing some documentation or code that reads
some "connector-type" and "bus-format" property?

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
