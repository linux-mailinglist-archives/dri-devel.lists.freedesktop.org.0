Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4866A2684
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 02:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9865410E042;
	Sat, 25 Feb 2023 01:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A500D10E042
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 01:30:12 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id o15so1784629edr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 17:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xdbzOcRjq9G4sFMOEFb17xXds/OZkETpcA/h0xDZLmk=;
 b=LxBa1NGaikzmswQ5eYuauhrZUuwPh5x0lP8u3tH5LrRO8T/VN+kzrY+GA30FD/T3+a
 Gga+BuOdgcJVAi88hi9sO3liQpQ7mBGBVUNMIEMRLRRvpNdE+sTC1UOcWs+zxhTWu3rB
 /D2B8Ktp0+EOQg+ZsNGG++5U5pPL2PFDLrg9yRp/vyJFPTd0sCObLPf4E3V/JjEEU+KG
 6hl1r+QL+JgwtOSUugdZW8SwPWpQFGmqJfiFqjYiSszNMJna72u7b+FAW5saGbgqnh+v
 l6mGtCN2WvlThpet/OvcNnRKsGj6Obxt8rYs63ys1M7MVhKoToRpCenDphjSe6Z5SG4j
 f4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdbzOcRjq9G4sFMOEFb17xXds/OZkETpcA/h0xDZLmk=;
 b=gvNhVXTzvPg8Kuxp6iryd7cW8OZDJt3iztIMDDz7HwjsBBZCa/VO8C5IgyZE6krKK8
 XRH7o+U1TXTHMMI/hex7n7ySqBHLKa0dOPi2iQHFUpgO6h4qPs16qYbsnHn1pdB+82VW
 6IX9pipJqxHOcFw9WKx/MjLCdmEF7D55TVgRO13GhkKGjCkxUJxzRXFk3De5ErwCejTt
 lGXHJ7zM7oK8RBHKJMDOgW70JdzyWdDKIJNdbxXV9+9Iibs5GGODXkbiqo1J7lt5u95F
 huRYeqRHHW5rJgbMQAQpDC3eupwHBBqI0VFabwMzKqE44qfShIh7T6EB9hhluORrYA4i
 BJ8w==
X-Gm-Message-State: AO0yUKXqiCGNtGMy2LoA01O8AyZsujbPj6IMqSjI7NRom4I+NZR1y7aX
 wnrTkxSyw1X4W7aiTYXqym+d3TYckSJiCTAqZfo=
X-Google-Smtp-Source: AK7set9OsYC3y/M46F2H22mmzbxWl97FfuzNqRJmusuxRxQ/gRg/b5RBuUU5DL4bEDuP75/gZZxk6jpTBFkFs9ohYJo=
X-Received: by 2002:a17:906:4ecb:b0:895:58be:964 with SMTP id
 i11-20020a1709064ecb00b0089558be0964mr12741554ejv.2.1677288610784; Fri, 24
 Feb 2023 17:30:10 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txhVJ3t_3-wMdWH7F+=_BbW19NYxAnm2cceP2uHR47_5w@mail.gmail.com>
In-Reply-To: <CAPM=9txhVJ3t_3-wMdWH7F+=_BbW19NYxAnm2cceP2uHR47_5w@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 25 Feb 2023 11:29:58 +1000
Message-ID: <CAPM=9tzPxixXnRuk0Jfs2ESw-eY43H_e5_FtGbxAhRmvaByYwA@mail.gmail.com>
Subject: Re: drm next for 6.3-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023 at 10:10, Dave Airlie <airlied@gmail.com> wrote:
>
> Hi Linus,
>
> This is the main drm feature pull request for 6.3. There are a bunch
> of changes all over in the usual places. I got two conflicts when I
> did a test pull, and I think you should be fine handling both of them,
> one in amdgpu and one in i915, if you need help let me know. There
> were some media/i2c common trees pulled but everything should be acked
> fine from those.

Any issues with this? I get nervous around 48hrs :-)

Dave.
