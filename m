Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A332E9D1F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 19:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5A489319;
	Mon,  4 Jan 2021 18:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5377289319
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 18:35:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D21682225E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 18:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609785337;
 bh=NsMJtfyjfFf8t2oznLe+xlCtgVKH4JII+ZGGiF/eUAs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jx9+X96vVmKXaqSBc2oxgtzghxgaFNfS3Qolqj5t8mlSDUGCAXnZqrVsrc7/+ostI
 oG58JfhVwZH97yVM1RrEDZ4bMmS1mD1x2Br/INKB+lVJVY1oaA4yFZmmUHKNU2wX/i
 ZSBb7kNrI5EoWocmAEaNBrRJjzMUJvhM4IzCbGh7o4YCg4vzuo7SmiLLvH5dd0KkE6
 meT1f4iCcbouzk5wDfgvHKtw8BfQ2zD2kfjIalzZA9Q9kZKaF0MGsQirzw5fpsIB0P
 8IQvhMfqFgzIwz9YtzU4TphN4wCUGl3fgyMVOOcBkvH7dX3qO0+G/x4+OiJjHWdfGt
 NFf6gz5U+dWng==
Received: by mail-ed1-f51.google.com with SMTP id g24so28374252edw.9
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 10:35:36 -0800 (PST)
X-Gm-Message-State: AOAM532Ry5wkQlpBPLTZ/3h0v/4GOD9oyr5EH+20sGKVmV41nv99alV2
 z8zmfqHfawFCUixEGZX+WwPHj3BVLt8mRgBNfA==
X-Google-Smtp-Source: ABdhPJyiAwX81V587mWQ6K37emEHsZmIP2mZ1ElHpEbVNqSfWDy89pwPgcfB7Gw6Ob3+wbTWAnPOaoXFgm7R6EQBXNI=
X-Received: by 2002:a05:6402:ca2:: with SMTP id
 cn2mr71984086edb.137.1609785335489; 
 Mon, 04 Jan 2021 10:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 4 Jan 2021 11:35:23 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJ6bL3rnTO+gMDdbuceikv4X9J=mAEGXAQs+riWj3XV2g@mail.gmail.com>
Message-ID: <CAL_JsqJ6bL3rnTO+gMDdbuceikv4X9J=mAEGXAQs+riWj3XV2g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] dt-bindings: display: Convert DWC HDMI TX bindings
 to YAML
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 20, 2020 at 12:50 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Hello,
>
> This patch series attempts a conversion of the DWC HDMI TX DT bindings
> to YAML.

Please resend to DT list.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
