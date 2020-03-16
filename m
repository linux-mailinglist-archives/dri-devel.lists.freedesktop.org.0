Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF98188720
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7C36E162;
	Tue, 17 Mar 2020 14:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948A56E447;
 Mon, 16 Mar 2020 13:34:26 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id l7so6514716uap.8;
 Mon, 16 Mar 2020 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yy099JAom5bAbi8Qbz1H+SJ7UdGj0QTEMi6J4hlPQso=;
 b=vBsyAJxjpSOP1wsnL4B+EtfS+VM+CLDQD1WIcpkioapzNrnXbsmNLyamLKgabMHPYo
 VNEI1U1be4bV4FE97MznPlVZx+phJGKihntwX3anPbZXUOBrQ1QSRQP5DMHNRKV6nkra
 EalNDU2L/jkRt5Mg9iKARKK8ODh8R3c47dQATNPCFBbi1bS4E2U7VieklDUsmDOSOktd
 FKRABcyVkbu67IRyoPmMATgR/K3fDvsByo3ykqM/PWP4d5478XR7+jUq0NVhBU0qB+RZ
 eWyOPNNJd1YOnrnA3NWsH4LEIjgW+JpQ8xhgkraGMMfjFWvRBB0d8aSV3TDPEPRuWrGP
 uvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yy099JAom5bAbi8Qbz1H+SJ7UdGj0QTEMi6J4hlPQso=;
 b=QytaymdDTwVUmmAF7P2deNIq26PFlZrsdcbsYEVzHG8oujjySLLJ8og5DECIiK5wRX
 6e7wDTxy2sJyps+sjiUB+1n9jhRB9JE2PBrmNTG2sJNfQmIFaeC5n204/e2HlT6FFQkl
 cakYUswjc+iKJghrN55DPnzSzmLMW3W43L3CUPfXXmTb3aXG5dQaTfaK1wbBlNYUcbYl
 wmnmm/rAIfeKQHOIuRcQHcU9/bv4VeaF00mmc1kFZ4ALhpBXKYyRx1Fs5am4eDO6K4nK
 +Gr3ac+TrGXZC44+qhE5DUIkoF2fN75Hrh2Acx9WCBryXk19yvedYq3wgkwxBhYUH+82
 EBGw==
X-Gm-Message-State: ANhLgQ1M7X60M51hOoIVRhzRH2ZrqEidPYQFo1H98P6dMtHirAB2AbCG
 RWIkj9PUS8Q34TB87R172+06+j+Vi5lb28Au1wc=
X-Google-Smtp-Source: ADFU+vsbKICcgyfr3v1DAw3IM9hKto3Koagz9JoDk44cGcHvl/eNriZb1K4uO2t6bD/NRmhqOi3v7EyzxLJEd9fdWQM=
X-Received: by 2002:ab0:67:: with SMTP id 94mr1431640uai.139.1584365665520;
 Mon, 16 Mar 2020 06:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <20200316130125.GK4732@pendragon.ideasonboard.com>
In-Reply-To: <20200316130125.GK4732@pendragon.ideasonboard.com>
From: Tomek Bury <tomek.bury@gmail.com>
Date: Mon, 16 Mar 2020 13:34:14 +0000
Message-ID: <CAO1ALzkOuPPozGcpAikD+cUiAb+JGQxPJ=QekdH+g++qKFqtEQ@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>  As long as we can fall back to not using fences then we should be fine.
Buffers written by the camera are trivial because you control what
happens - just don't attach fence, so that the capture can be used
immediately. For recycled buffers there's an extra bit of work to do
because won't  be up to camera driver to decide whether the buffer
comes back with or without fence.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
