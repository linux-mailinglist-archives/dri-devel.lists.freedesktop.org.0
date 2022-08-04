Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A5658A0E8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 20:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8635A453E;
	Thu,  4 Aug 2022 18:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC83A3710
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 18:52:28 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b16so797598edd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=d9A+1UrQLh0WcW9MhwNlbIKjJoOc9nVaeZ+f3kn5XJg=;
 b=Wghr6irArPcwVSc+CNnhrrsEu9dnr4MgYqspEvpRuXFzsOtqFWg2OW0RZw0DsbJhbG
 7KYJuxI+hGsaf1e3eCH86NhWL3mKYHLchNkwelwizVdbqx2TCHmSyTmd7/UiTNDRDtqj
 1bkDxMnc43SYw+VE+NmTMF0O+9AkEy2ziVWdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=d9A+1UrQLh0WcW9MhwNlbIKjJoOc9nVaeZ+f3kn5XJg=;
 b=Pyh+31rgiIrQTNFkki0n13K+Lh0v0jzuozeuTv6Rtt/1YQj5b7As9faK4p21iqji++
 AGDDcBJUtgiPv5SNssG3J1hROAdT1YgvWNzDFPKA1wjFTlzW+LzDM2YHAt0Qyy8+nwqs
 gMM0tDZ0ImJigt/Dyb2EdnFd6ywuCIrD2u72sQNyXhDdiBSxFHITHsvfAH7tFATr8hyD
 879Y9ZI+z9IHDK0WaRwdXTDu8rlB9+fths9UkTM6UVowImi9V74eereeA5j82U6prgit
 vSEelhjLfPmlQCMDJOQZn4NrhVfqVGnIij+eXyC7M4f1+ake+KMzWuP9zQNdpFMmMeY+
 6gJg==
X-Gm-Message-State: ACgBeo0I5nyvEkW/y5lty4BEhNnQ9io+1mqsXHdY54nf3L53QpBC/xdl
 +shPD85OXqVZb7dCHuZF4yRg0QMosOvGB3jI
X-Google-Smtp-Source: AA6agR4NL3N6yJT91I+B20IdAUtW9SUJ3DNF4DQuyOSD9m7V6nUwBa8B3a+PgIx6cuCBEOka2FNr+g==
X-Received: by 2002:a05:6402:3552:b0:43d:a634:3997 with SMTP id
 f18-20020a056402355200b0043da6343997mr3272264edd.389.1659639146513; 
 Thu, 04 Aug 2022 11:52:26 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 10-20020a170906200a00b00721d8e5bf0bsm625989ejo.6.2022.08.04.11.52.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 11:52:25 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id z12so770708wrs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 11:52:25 -0700 (PDT)
X-Received: by 2002:adf:edcb:0:b0:21e:d043:d271 with SMTP id
 v11-20020adfedcb000000b0021ed043d271mr2265646wro.274.1659639145076; Thu, 04
 Aug 2022 11:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <YuwRyQYPCb1FD+mr@debian>
In-Reply-To: <YuwRyQYPCb1FD+mr@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Aug 2022 11:52:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
Message-ID: <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 clang-built-linux <llvm@lists.linux.dev>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 11:37 AM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> git bisect points to 3876a8b5e241 ("drm/amd/display: Enable building new display engine with KCOV enabled").

Ahh. So that was presumably why it was disabled before - because it
presumably does disgusting things that make KCOV generate even bigger
stack frames than it already has.

Those functions do seem to have fairly big stack footprints already (I
didn't try to look into why, I assume it's partly due to aggressive
inlining, and probably some automatic structures on stack). But gcc
doesn't seem to make it all that much worse with KCOV (and my clang
build doesn't enable KCOV).

So it's presumably some KCOV-vs-clang thing. Nathan?

              Linus
