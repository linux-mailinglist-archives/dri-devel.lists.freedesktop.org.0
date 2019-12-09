Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF9411828B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748B66E845;
	Tue, 10 Dec 2019 08:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2352D6E49B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 15:10:01 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id a22so121430ios.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 07:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xcWrJCCDV9FLXdr0ZUztddjQSSx3x7+pXvp+/EC4d4s=;
 b=jCwHdkzjuZXdAkFGt53WBUw98CEGScyc/VWwjQ7pxH+VWdtrquDNMCbo59WLI4gWmZ
 FLY7q481NWsVYTxuLmnRDrwcP9ZTE64og3Ks1EYf96dttxJ8/fV+ab2gimu4+16zUtRn
 FjTGKEqm7de1F01zLV4vmAsXOJm+fXN+FNgyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xcWrJCCDV9FLXdr0ZUztddjQSSx3x7+pXvp+/EC4d4s=;
 b=FsR0Z2vZnFc88wSBXAG0wEY59aXfEzybHnVNSUP0TEUx8BkCNCFGWIchePTMlxlrD9
 x+kmhrBvBvdAs7vqwXjTXi5nGc2vd26QsnYSbk9BIaoBS4depV/X0rQpyDaFuuh3Zhl6
 mqcFWO0ekMQVSTk6KfNqEqVErqmmThBgyz8bNvWq9kJCtl1ISw6AoJqjGT/A8nEQvK74
 cJAgT7UXgUEruhbuFebcHCFWlfkrx0MdyM4fG+6k9XnsY6/Qkyss7oDLLrEo53+dxhWx
 VGtBITYk2EMhcNIydrAa2KOuk2W+U6wsARmNQMO6KT3eFk1NjlmPpILBWi5WyjWIVvDj
 +GtQ==
X-Gm-Message-State: APjAAAWorG1pKMAg/NGbz3a5IYUwXdihc6IGch0+IwuE4aOvaB5IJrqE
 tyTWFEvdy+3FhM3t/PH33pi6r39fx5V+CiDOat6aDA==
X-Google-Smtp-Source: APXvYqzg3szTNJsFOs7seXieuvnWRJ9uISz+Z/GGKMgmwYIKFt9RhcKAORgRuxrGJQAz5EnB4PhlNDhQ7834VEmeZRc=
X-Received: by 2002:a5e:c204:: with SMTP id v4mr21682825iop.106.1575904200419; 
 Mon, 09 Dec 2019 07:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20191209145016.227784-1-hsinyi@chromium.org>
 <20191209145016.227784-4-hsinyi@chromium.org>
 <20191209145552.GD12841@pendragon.ideasonboard.com>
In-Reply-To: <20191209145552.GD12841@pendragon.ideasonboard.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 9 Dec 2019 23:09:34 +0800
Message-ID: <CAJMQK-hNSF-Vu4CfTKiCUdBRmaONf=Lp3NN0-nFor6mxY1seJg@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/4] dt-bindings: drm/bridge: analogix-anx78xx:
 support bypass GPIO
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
 Devicetree List <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 9, 2019 at 10:55 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Hsin-Yi,
>
> Thank you for the patch.
>
> On Mon, Dec 09, 2019 at 10:50:15PM +0800, Hsin-Yi Wang wrote:
> > Support optional feature: bypass GPIO.
> >
> > Some SoC (eg. mt8173) have a hardware mux that connects to 2 ports:
> > anx7688 and hdmi. When the GPIO is active, the bridge is bypassed.
>
> This doesn't look like the right place to fix this, as the mux is
> unrelated to the bridge. You would have to duplicate this logic in every
> bridge driver otherwise.
>
> Could you describe the hardware topology in a bit more details ? I can
> then try to advise on how to best support it.
>
Hi Laurent,

The mt8173 layout is:

MT8173 HDMI bridge-- hardware mux --- HDMI
                                                   |
                                                    ------------ anx7688
There's a hardware mux that takes mt8173 hdmi as input and has 2
output port: native hdmi and anx7688 bridge.
If gpio is active, we would like it to go to HDMI.

Previous approach is to make hardware mux a generic gpio mux bridge,
but this is probably a very rare use case that is only for
mt8173.(https://lore.kernel.org/lkml/57723AD2.8020806@codeaurora.org/)
We merge the mux and anx7688 to a single bridge and leave this as an
optional feature in this time.

Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
