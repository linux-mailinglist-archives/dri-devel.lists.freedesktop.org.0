Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB2D1741CB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 23:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B384489915;
	Fri, 28 Feb 2020 22:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5966C6F4EE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 22:05:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 83so3192664lfh.9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 14:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C8LpeFRkJkAVGCGFA7ZkDQ8EDfylVrvQYhKNrzB5Agw=;
 b=ojCXi//c/Oh73F5Il6IazTwlBEsFoNfw47/YGyUECYl4dvUC6WgxSI3iyIlBLbz3mZ
 OSWB0BXF+JhGvD/zk+/GTAVNuJymMfHWiE5Sv3OzrtLzD8wvItVwx6Rc09jJQNdTPYzX
 r+nTnXjxGnxb2Xi53R4UsUcTjKMg0E5gsaEkeqNNdoLNPTlR4pZw9KtGmo/qhkaQZY0q
 Ebc8ul2qrGS9XuhqUFeb5gUHcchMPES2yWxB5pCRDT3o5006DzOBQ6kNkjHlHYrGFg3y
 /wC1+1VRU56iKegko8xSykYkKhnvdO+/IIHG94etItcj9WvTOxgl9cgYOkx6IiaBsY6G
 TagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C8LpeFRkJkAVGCGFA7ZkDQ8EDfylVrvQYhKNrzB5Agw=;
 b=VGT25tu6fMkLY0sHo/yblXhDWrlccNoZZTTYwqF4IQsTnCK44mI9mm90axyLpJvsCq
 Xin2tSydBwwjInENi9p1HfpRpyMDmfQup9HIuJP1VCieyarm/MSJDdydPnTXEouOIZK3
 h+XvfGuoOZbbNifbe2Yejme7TPmqoi5GjnIKoCyu4tLjj4Hw+DCXomvvCu1cfH+NM1kV
 9U1ogVfAY3uHBWZBwoxADFLwpjnnHP0mwKGUJmfEynOxxkgxxN1mX09ab3/EdgnxQFUE
 YHvHyXZsIUIMWLraTqBi7wfTPid+COX/QA0Z7luemtgyZ1LR6WaW3Z5b7VPHifdezgHA
 FyPA==
X-Gm-Message-State: ANhLgQ0bVFzSEYjVr3w9SYme66cCo+OCCfVViB6Z2i9FUOOBkEmqZFvE
 vq+mnMKnVF/duvaCThfORqackHq5YIAzttcfnoCSPQ==
X-Google-Smtp-Source: ADFU+vsnW+F7X3gpdEz8AQTDqD1Tj7f66W9FTRZOnyRHh9OXBDCJ69RY3C5fHJ4DyNMTzylusEt2hk5oPHgCphc0DMY=
X-Received: by 2002:a19:87:: with SMTP id 129mr3655815lfa.217.1582927553833;
 Fri, 28 Feb 2020 14:05:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582913973.git.hns@goldelico.com>
 <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
In-Reply-To: <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2020 23:05:42 +0100
Message-ID: <CACRpkdYSde=6JBBbe3sL3hDHhGAeOfwadT0BvL0n+-F0O2vX0g@mail.gmail.com>
Subject: Re: [RFC v2 5/8] pinctrl: ingenic: add hdmi-ddc pin control group
To: "H. Nikolaus Schaller" <hns@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Burton <paulburton@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 kernel@pyra-handheld.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Andi Kleen <ak@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 28, 2020 at 7:19 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> From: Paul Boddie <paul@boddie.org.uk>
>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

This looks good, can I just apply this to the pinctrl tree?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
