Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 220EE265CD1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CA36E9A0;
	Fri, 11 Sep 2020 09:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1684E6E965
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 13:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599746093;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=sQCBpC4vP/mEdqY1zYkRBqalTkYAXoFGxKxAEijy+rA=;
 b=h15biseBUE/sAwpol7TQEsCIIbTEjvL/3sjN0GkjonrQ2ca116lI0AjfF+lePvXvZj
 nIBIVG1w6pcz+9kIyQPAnUH+Qdlh/xgMMvNfbET5lgpfjGkys8EtgHYNb7vZAgrHEKGj
 psvFyQREawQOtD1lJ3yswNGmCF2zbvfY7uD1l01OzquvBKkIM01w7SU0LtwmXprb/Z9t
 u1U0I59OKfZdsViThFKGntczOjQa6lknfs/kj79jC0ngEdLnXD5ALCs1Msv+nPph8p/O
 KixGbaF3ySvVTEHmUhHIVzwZZNNu5gUkeGpyaf6hk+hjxfUY+/FWvn69uuNOHmsnd41E
 q2+A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSfXA0N8oI="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id n03b0dw8ADmjepb
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 10 Sep 2020 15:48:45 +0200 (CEST)
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAAEAJfBgWKk9T0y81C53r5vNe8jFZdUPp72PzypB4zbF8hJDYA@mail.gmail.com>
Date: Thu, 10 Sep 2020 15:48:44 +0200
Message-Id: <AC1E11D0-717B-44DC-8A67-CB62ECCA7301@goldelico.com>
References: <1940005.XIBaf5lNV5@jeremy> <1857880.I5TKlsx52r@jason>
 <CAAEAJfDU=rvQ4aEAbBrveLigUjoYFGhLZJ7PsE_WpoOYxaDqdg@mail.gmail.com>
 <6531669.OW97vx6Khr@jason> <B8QFFQ.FVZD8SCWAWD51@crapouillou.net>
 <CAAEAJfBQRLKxaR_6HUi-Dvoc+_WC0JPJNGH5C0rz-yxhOwArdw@mail.gmail.com>
 <829D6884-D1F1-4197-B25C-F0DBF2F4AEA7@goldelico.com>
 <CAAEAJfBO5-T9oG_whDu5=MDcthAJpbJ5ER3eJJx1gXMsHu-v7w@mail.gmail.com>
 <2093A5E6-28CC-42C6-8CF9-3E78942254F4@goldelico.com>
 <DD421AB9-E419-41C1-B23E-B7FC4603C433@goldelico.com>
 <CAAEAJfBgWKk9T0y81C53r5vNe8jFZdUPp72PzypB4zbF8hJDYA@mail.gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Paul Boddie <paul@boddie.org.uk>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ezequiel,

> Am 10.09.2020 um 14:14 schrieb Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>:
>>> With the comment from Paul, I think it is best if you push them for review.
>>> 
>>> My patch set based on v5.9-rc2 is here (including one EFUSE patch which I have
>>> included only for making my Ethernet interface work for testing):
>>> 
>>> https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/letux/jz4780-hdmi-v5
>>> 
>>> Please take it, do the required squashes and rebasing and post them for discussion to the
>>> appropriate lists.
>> 
>> I hope you are well. Do you plan to do the squash and rebase and posts?
>> 
> 
> Hi Nikolaus,
> 
> I wanted to use the component API for the the dw hdmi glue driver
> but somehow it wasn't probing and I haven't had time to debug it. Using the
> component API consistently would allow to do some cleanups IMHO.

Yes, that would be a good move as long as it is not a dead-end-street :)

If you have something to test please let us know.

BR,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
