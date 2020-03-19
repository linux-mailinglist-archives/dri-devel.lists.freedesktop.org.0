Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8501E18BB70
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 16:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F157789453;
	Thu, 19 Mar 2020 15:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E3F89453
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584632707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uarX0K0WkQyekg6RxqpBFi4oNpTA2DnAzyM8/zQnD+s=;
 b=cJGITio++tJ2yjSR5VFoBdamYQhPxABhX+N20aUnDl3Fs2SbmoUe6pkeDop9MJyvLH1pd0
 9bBnalMhILHV3SMuHOE6jA+dFiu94RqnRW7qrCH7zxGW+QB4eDOFhAnkADFo3WQMqcjC6D
 LQaz8bHrdYhMhKINVAmLnV/PeXJ8ha4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-g4mCHChhOSCsbNLMAgnhmg-1; Thu, 19 Mar 2020 11:45:05 -0400
X-MC-Unique: g4mCHChhOSCsbNLMAgnhmg-1
Received: by mail-qt1-f200.google.com with SMTP id r16so3064061qtt.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 08:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=uarX0K0WkQyekg6RxqpBFi4oNpTA2DnAzyM8/zQnD+s=;
 b=SWL9mnVq/t12+18J+uv3jXPndVN2KNL8KoetYNfzwhH6P8E2F0rx561DR53tU5Lboq
 i6CiGMrpfC4lfwt09oOEQK6zJxaTpglAIb3/H+JoMSeYQ5L4CymXCllRgBoU9rK/iPxp
 4FlMdbc/Vsf41XyLkah1T3EzZcl91935YXA2/VbOfWP5MFMNjCvOAzKsuUN2vOHsddn2
 uc20rOT/RS1FwsEG7JCTMP3RAWIcM4qOGIHagj1slCDqgSHJQ/TYzIoZflr9Oylv3M0r
 hmTCA5qHwOa9Tsx4FfYnz/ivDlUXsP07wYVVyFxExPmHL7tbLPxOyNmfj6iZNkK5GImq
 QXJw==
X-Gm-Message-State: ANhLgQ0EVDWGt3LwdPj633a6pKpvxBY4n8xGQ7X2dWR/5czoJp0MwLFx
 Jr8LTVwY6Uw5uuR24VvHo0bqe53oFTThlYZHFv+aAGGUTeYjcvT4+3HJNvJF48rdQrSmwCmMXfs
 aiJjEVLpMwrAu/pHxVfQgaX9HZpZA
X-Received: by 2002:a05:6214:286:: with SMTP id
 l6mr3683858qvv.200.1584632705007; 
 Thu, 19 Mar 2020 08:45:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuB21gw3DQ47Dzt+RdMDtOLxO2AyCZvMSK2YS3agFz+vf8F01Q1TUib7Xf1+lv5J8NGf4xmAA==
X-Received: by 2002:a05:6214:286:: with SMTP id
 l6mr3683742qvv.200.1584632703694; 
 Thu, 19 Mar 2020 08:45:03 -0700 (PDT)
Received: from desoxy (c-24-61-245-152.hsd1.ma.comcast.net. [24.61.245.152])
 by smtp.gmail.com with ESMTPSA id f13sm1771431qti.47.2020.03.19.08.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 08:45:02 -0700 (PDT)
Message-ID: <edfc1443ad26af30bd954127ede24a0f2fc349fd.camel@redhat.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
From: Adam Jackson <ajax@redhat.com>
To: Jacob Lifshay <programmerjake@gmail.com>, Jason Ekstrand
 <jason@jlekstrand.net>
Date: Thu, 19 Mar 2020 11:45:00 -0400
In-Reply-To: <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
 linux-media@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop .
 org" <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-03-17 at 10:12 -0700, Jacob Lifshay wrote:
> One related issue with explicit sync using sync_file is that combined
> CPUs/GPUs (the CPU cores *are* the GPU cores) that do all the
> rendering in userspace (like llvmpipe but for Vulkan and with extra
> instructions for GPU tasks) but need to synchronize with other
> drivers/processes is that there should be some way to create an
> explicit fence/semaphore from userspace and later signal it. This
> seems to conflict with the requirement for a sync_file to complete in
> finite time, since the user process could be stopped or killed.

DRI3 (okay, libxshmfence specifically) uses futexes for this. Would
that work for you? IIRC the semantics there are that if the process
dies the futex is treated as triggered, which seems like the only
sensible thing to do.

- ajax

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
