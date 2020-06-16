Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0791FB297
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 15:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEB56E8BC;
	Tue, 16 Jun 2020 13:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5236E8BC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 13:53:20 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id y123so11464771vsb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 06:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IfFCYYINLlK+xRSAgMMH1Wy6Wd0UnK9Wnz9cAqANUqY=;
 b=DaNhA8c9JhSnZplLuTv+zCwCBKYjZS1NeUPiPBs5OpTzrnciqVudrPy3ilffFVFISe
 eYJ9mkegNFsdz6Ro1+QAYXeHeg7UxsS8B3g7QrTLGxeOvE3u0VllyjqCwVDngGo++6OQ
 ezPpZ5szpTAk4P0RiwDiaQPkMLc2RrkGKUU4mfXVeKXy3RHK/nkIDPag2xbOmi3At8dE
 jBUgGg+HUgm0AeJpkvK2Uxl2pQF0b1vloTr/eZH+koNIiUeEYA5xA5od0/Sins7t8+If
 uT7GNeVtELetHiKpXyG0vQZKaB6Z+35mKsTHl0OxWpZBNCzHTCazSIpDddH1fcF8HaTy
 WNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IfFCYYINLlK+xRSAgMMH1Wy6Wd0UnK9Wnz9cAqANUqY=;
 b=LxMn82WlyXsV6pFLWn3PWvZ4tXdWbJVxs1shrfKZl10VWTa+twir9+hed0m1OWp/jJ
 WUuJ5PU0R3yHZd5Bb+nY8Ktx6nnRcBVtZj44zG7GQuekKbVwISC/JN9YritZT79HJTbh
 Z1B50wwY14p1tVHc2rEMS44S5JA+iNeKy/RCOV/P/UBEy715ig3Z/H31CIgPeU/DvmBY
 1nV9pdXtyQj5dKhZWf6HxMokyq5uoUAu6idxY3WcqJcELHd2iEtPKK0/Wn6e0Ou5qbso
 5+Bedbq3Ik37d117tBqJ6oi/d8LrAN+YLP6bADz6J99UFLMxD4brPEUaoMnM+rt16BT1
 9d1Q==
X-Gm-Message-State: AOAM532Xir2+Y8QTQNBH1o9smS6s00rMlA11xo20anY+ArVK6NgL7ls5
 PYbg27JVYA0hERIxsxXGlr5N8+SZzBtHChM148g=
X-Google-Smtp-Source: ABdhPJyYCaWWS4VAecgTMt58Iqd7x8SgMFFk6kxOo6p4UjoXc405qqvs6pkt4WRIjtdM4E/aGQWGxzK7q1CL30KggLM=
X-Received: by 2002:a67:c18a:: with SMTP id h10mr1635663vsj.186.1592315599780; 
 Tue, 16 Jun 2020 06:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200515083233.32036-6-tzimmermann@suse.de>
 <20200603090929.GG12456@shao2-debian>
 <CACvgo50e5ddtqWfcBiB9b05XGVuTz=8m4yH7BvAqwV2mKcuupA@mail.gmail.com>
 <62dc5960-ef0d-1fb5-d377-1f0eb9a4bc0d@intel.com>
In-Reply-To: <62dc5960-ef0d-1fb5-d377-1f0eb9a4bc0d@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 16 Jun 2020 14:49:38 +0100
Message-ID: <CACvgo5111Z6Zq4SYYKOJTbiSYPwY2JmG7apX=qx4k3e1DPO62Q@mail.gmail.com>
Subject: Re: [drm/mgag200] e44e907dd8:
 phoronix-test-suite.glmark2.800x600.score -64.9% regression
To: Rong Chen <rong.a.chen@intel.com>
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 lkp@lists.01.org, OTC LSE PnP <otc.lse.pnp@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rong,

Thanks for the prompt reply and information. Can I suggest including
the suggested information in future reports.
I've included a command for each one, to aid automating things.

Namely:
Xorg: 1.20.4 (or None)
$ which Xorg 2>/dev/null  || echo None && Xorg -version |& grep -o "X
Server.*" | sed "s/X Server//"

Mesa: 20.0.7
$ grep -E -o "Mesa [1-9]+.*" | head -n1 | sed "s/Mesa//"

Mesa module: swrast_dri.so
$ basename `LD_DEBUG=libs glxinfo |& grep _dri.so | head -n1 | cut -f3 -d:`

Mesa device: llvmpipe (LLVM 10.0.0, 128 bits) (0xffffffff)
$ glxinfo | grep -i device | cut -f2 -d:

GPU: Matrox Electronics ...
$ lspci -nn | grep -E "VGA|Display|3D" | cut -f2- -d:

Thanks
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
