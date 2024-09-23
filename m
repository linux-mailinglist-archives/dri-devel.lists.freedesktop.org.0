Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FD697E5E6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 08:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5747510E37F;
	Mon, 23 Sep 2024 06:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bE5msank";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E13010E37F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:16:32 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53568ffc525so4461988e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 23:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727072190; x=1727676990; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HsmFsHE7XzzhoDSXVK/Q5axcYBPq9FFiEYtiI/KoYqs=;
 b=bE5msankPoAJrM6E9ux5brI66iiOtcJSS79mwfcrBk9i2GXXpZWR2lNHUxqSgWFitb
 Mk8dgu3OJf3dAck1ZN6h7te5K243+LyUMbkWh4BerQa3Gv88KfLEm1zcROpDxee39xEt
 VfAkvN78LAZj7MesWciLKHusAXF7TVmcv0QJHqS+JL3H7p+2+5RI631rZX3V5i9JPfNh
 qBY4yWc4lt1wLOiZta2z4lQqOGxqVMv5WRVHEr9s6CA0JmKiuZ9n3SXDjEIgBDeQbT4c
 PYLTNLq7/J8oFEnbQCUxjHyrJPnscE6aBUSJhJiXRVUO9vk4ChE5EWywyJBdBbzfhDx6
 NO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727072190; x=1727676990;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HsmFsHE7XzzhoDSXVK/Q5axcYBPq9FFiEYtiI/KoYqs=;
 b=KKYSAXKwSc1SLAOmpAoh+qIjxOrhme9uydS5ct32mdOfgVMob2dgQ84qJasjnTGd+X
 AQ6N7b/NPprbpl16KOiCJiGUvb/ql5+9kqdvjPmCfOytGTRndsEXNWKF5YdM9/ben5AW
 P65eCDN0iNt8T2sypmlOW/N9wxJNyLKwuqOQL0c8XhuU2djFq6FscGP94tEbjUnFme2m
 oUMXuLXgBlf2hIB3yKVDq3ZPDKjNrNE2zltLsTMT7BIKkZ8x8qUlDiHqwhUvNPXDjAr/
 JCWHJzOmLRiL0SLvVKOtwiQol/1jif3QiZXvBdllLTzJJmdM2vYtD1qPq6VUWGWqmV6E
 q1jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm578L/Mharv+EpgH9sbol/prR9ApNt5thZG7lQxIMahOAuZP2/lH+/VnZE5L1rKtMDp7JbNpR0VE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvIY3eNLXdX4877pdPguun6Ta2Jl+GNzn4Swvr1E1COjO0RqzI
 ObsO9qkfKGa1aNOfo+/pA8d0/DPHphrtSsBfQHzqZENMcbxBZZsSQFDAG/vdz5U=
X-Google-Smtp-Source: AGHT+IHmW7JOpyVhjNX4M0lOzlw3ScfVv0bo0OAeE/aiMXJ6/c/MkV8H7Thi9KSkuorm9g8St/aSDQ==
X-Received: by 2002:a05:6512:695:b0:52e:a68a:6076 with SMTP id
 2adb3069b0e04-536ac336d8emr4520518e87.49.1727072190066; 
 Sun, 22 Sep 2024 23:16:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a86c7sm3192855e87.223.2024.09.22.23.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 23:16:29 -0700 (PDT)
Date: Mon, 23 Sep 2024 09:16:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.Wu@ite.com.tw
Cc: treapking@chromium.org, a.hajda@samsung.com, narmstrong@baylibre.com, 
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kenneth.Hung@ite.com.tw
Subject: Re: [PATCH v1] drm/bridge: it6505: HDCP CTS fail on repeater items
Message-ID: <kek5orlxcrejicq55mczj6gmjgq2pgynzxk2qup65iyuedcwdy@maird5uixbys>
References: <20240919025551.254-1-Hermes.Wu@ite.com.tw>
 <CAEXTbpc7N2v4LwoZ4wpHXi7ogyqGwYC3Gpt5sqfxtOpYrngPLg@mail.gmail.com>
 <nczuje3ur7sf7uqkygtziwnz5p6b4b7bf5on5crljr2ijmblrv@ym3fkvqxbjq5>
 <467ea5d3380843a1ad1f2f2429bb2833@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <467ea5d3380843a1ad1f2f2429bb2833@ite.com.tw>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 23, 2024 at 05:21:41AM GMT, Hermes.Wu@ite.com.tw wrote:
> Hi 
> 
> Sorry for the confusion caused

Please don't top post. Answers should come below the original quoted
text, not above it. Otherwise reading the email becomes really hard.

> 
> Last patches did not switch to drm-misc-nest. And I need re-create patches.
> 
> The HDCP patches is now on tow threads.(This one and the one include MCCS patches with cover letter)

Just make sure that when you send the next iteration of the HDCP + MCSS
patches you provide the history of the changes in the changelog (either
in the cover letter or in the individual patches). Also please don't
send several patches using the same vN. I'd point out the 'b4' tool, it
can automate a lot of such topics for you.

> Should I keep on this thread or restart a new thread?

Please always send new revisions as a new thread. Otherwise your patches
can easily get lost.

I suppose that [1] is the latest revision. Please review and implement
the feedback that was provided to all iterations of your pachset, then
send v3 as a separate new thread.

[1] https://lore.kernel.org/dri-devel/vxs3eklfifsnaq5rn6kppegfv3plsviqaq5nvlzo3fgazwj6y7@od4atbvf5ep3/T/#u

> 
> 
> BR,
> Hermes
> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 
> Sent: Friday, September 20, 2024 11:50 PM
> To: Pin-yen Lin <treapking@chromium.org>
> Cc: Hermes Wu (吳佳宏) <Hermes.Wu@ite.com.tw>; Andrzej Hajda <a.hajda@samsung.com>; Neil Armstrong <narmstrong@baylibre.com>; Robert Foss <robert.foss@linaro.org>; Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; open list:DRM DRIVERS <dri-devel@lists.freedesktop.org>; open list <linux-kernel@vger.kernel.org>; Kenneth Hung (洪家倫) <Kenneth.Hung@ite.com.tw>
> Subject: Re: [PATCH v1] drm/bridge: it6505: HDCP CTS fail on repeater items
> 
> On Fri, Sep 20, 2024 at 01:27:54PM GMT, Pin-yen Lin wrote:
> > On Thu, Sep 19, 2024 at 10:58 AM <Hermes.Wu@ite.com.tw> wrote:
> > >
> > > From: Hermes Wu <Hermes.Wu@ite.com.tw>
> > >
> > > Fix HDCP CTS items on UNIGRAF DPR-100.
> > >
> > > Signed-off-by: Hermes Wu <Hermes.Wu@ite.com.tw>
> > 
> > Reviewed-by: Pin-yen Lin <treapking@chromium.org>
> 
> For the sake of somebody applying the patch because it was R-B'ed
> 
> Nacked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> The commit message doesn't describe what is being done and why, it
> doesn't have Fixes tags, etc.
> 
> Hermes, I'm not sure what's happening on your side. I have seen several
> revisions of this patch with minimal modifications (and being a part of
> different series). Some of them were marked as v1 (although you've sent
> different patches as v1), other had v2 (but no changelog, etc). Please
> adhere to the described process of sending patches.
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
