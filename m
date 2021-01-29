Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110DD30898B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 15:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F266EB4A;
	Fri, 29 Jan 2021 14:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA51A6EB4A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 14:31:03 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id f1so12779505lfu.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 06:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gM7CgX3Tibv6s90WtRBubg5Cgm+MjZt313JD63t04o0=;
 b=JZcfyBoaKRFWZDR4VGZBui+lEQrnZIVzIRgd7fHVM955vbzOyyoD6ZxlBqoZnrYcER
 qKlh13mPRS7cKNjl6UiijQK7l3nq1dmQQ+MnsZFfeS3HOeSXrGawFQdFEcN55liu3eC8
 BsbsZKGrM1hmF3taIbNOyTNRk4cLA8IMn6/0651nLpwhKBleea9yRdeGvA3g7P3zLkf6
 XAul8FP4mlozeD/8Rvhhi+YzqNAK9wpDe+tHfEfR0EpDZNVikCy1JVW23NL+8H6YqeJJ
 Sqbkocqlb+h7YnLgnKqv97BJ5Tp6MVqZuMAvJXIFKYv/ylBgVw4l9dQ8EBeocpAqErmE
 F/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gM7CgX3Tibv6s90WtRBubg5Cgm+MjZt313JD63t04o0=;
 b=FBwYK6fXei7G86aTCsUIidFH7EuLNtr2Fk1N/T2oi3XDoMaGzgkrcEI4J6H8WvZ7hf
 WJxOUSzuiRFo94uoCjQTYxXXV55mRsAXQPHALnrVrNARphPNo0W89E/N3jrc8zqqJ2Wg
 Fp3k1SVzx52hqvJe3+kknHrSnzsGh3Icx5216qDs7HdxK8X6qWtyAze+3U/Yx6NNYRpr
 jbDwWVnjzS061IW1aLOz4j7ZuATa7w1NwrSNfeW1bHUDxQ8LIvxpLkQuU/yk1te+Y03d
 eIF+a/+to+6wB+3JED3DbNGPa+4+P3y/INGmTCG3Z1mJqYq3dmsYMKj0L6oN9TFzpE0g
 X9Yg==
X-Gm-Message-State: AOAM5329Yef4EljOy6vGmkmJ9OY9xF5ewCD0cjddD737xBD8Cb3w7E9R
 0SExIwlhkLCFTLhkD3yq8jerUxeW+3yS5qJrZeQ=
X-Google-Smtp-Source: ABdhPJxrsmZMSkGelGm4dZmpjQf7/ptajLKQhuROJRCK4Co0IHtW5dGYAupzocfkBKiATp/b971Xc5XoaSkcAfhckIY=
X-Received: by 2002:a05:6512:77:: with SMTP id
 i23mr1856157lfo.247.1611930662355; 
 Fri, 29 Jan 2021 06:31:02 -0800 (PST)
MIME-Version: 1.0
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <20210129095604.32423-3-tzimmermann@suse.de>
In-Reply-To: <20210129095604.32423-3-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 29 Jan 2021 15:30:51 +0100
Message-ID: <CAMeQTsZngDDdDe+r2EsuQ5b02_=VMggD8CXsvebXZFCi4neB-w@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/gma500: Remove Moorestown support
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 10:56 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Moorestown is an outdated mobile platform with apparently no users
> left. Remove it from gma500. The MID chip-setup code in mid_bios.c
> is now unused, so remove it as well.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

As stated earlier. This code must stay since Oaktrail is still supported.
Perhaps there are still MRST specifics that can be removed. Let's have a look.

-Patrik
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
