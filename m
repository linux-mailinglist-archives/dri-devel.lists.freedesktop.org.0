Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D36E85F6E7F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 21:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CB210E87F;
	Thu,  6 Oct 2022 19:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23B310E499;
 Thu,  6 Oct 2022 19:55:40 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ot12so6993204ejb.1;
 Thu, 06 Oct 2022 12:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qoNK9gOMUekLsnTTqNVMHHQjqI/P+O7lQ+POtGrsip4=;
 b=Nu0+z3x7BynDTW0WDQ023bafpHEoagL2OPoBRPup5QUxc9k9HMy6v19fdC3kUhLNXF
 vber1/xzSeZ/U5W8o9wrFt4TrLTqNjbUzDQ5TmC1jtZofrUOai8PSLRV3Mp9VnkwuQDo
 8SLLuhhSNzGJTqsAnZfFRSyy9YV/drhTBzZBam6TxZCuwHduWa+RfhCHC+zNUPXrKQ2g
 8QZIBmnJwKsIoKbNddHp/OjjJC+KWL6W+yNEiM8xxeZMIWCBdq9j9jxUJHdRD2p1IEeV
 XJ5n5bfyFIb6Yv5rY/+k+IyoZVAl7p68bGeilFE/JvyBeKXgVXkbcF/xxTDtsknKIvpy
 7CPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qoNK9gOMUekLsnTTqNVMHHQjqI/P+O7lQ+POtGrsip4=;
 b=KpzwQfUb/uuLiN+USTJfOHNtxQuhnfDogio+9pnF9OMP9+53ZP2t8gpdpXc559JAk3
 H96f/nYHxqu2CzcFJYWOp4oitnFp8Xa02rBAuUOHlpJQdTp0FiE/h48P1yV6bdWAF9KG
 pSjA7HevrExN23h8pOtExVus7vAtulrpyXNzNZeoWCFmrcHq6iES5X6gWnkvkPc/nmlw
 gHtiy91aclS9+HzF7J26Ni1PU9g+mY9Z1ObNXHvTuaTLeqcKlZcx2bf9R4s/PTudSQFp
 FcTSTkvH8RloImeTMUsgItWdwGBA/ksmATu+UTtwws+Dp03k1x1GVPz9HxV2VGbZvGhH
 qMNA==
X-Gm-Message-State: ACrzQf29qylEBUmuV8/9XTEt3YZOSZSPPPHPJ+DrBBY/iBe3aa0R389F
 e91Er0QMKbfDfXHcjHDIguvZyJ6F5Qe1HIN+z0w=
X-Google-Smtp-Source: AMsMyM4wckjg0HNozBCina8M5IoyBta1vET7P2VQk5+K5aDwDpwDZkT9csypQUMoBSklUdJDGwSStOOqBcVlKeoCRg0=
X-Received: by 2002:a17:907:6087:b0:78d:2d1c:c050 with SMTP id
 ht7-20020a170907608700b0078d2d1cc050mr1242629ejc.481.1665086139135; Thu, 06
 Oct 2022 12:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <Yz6W+j+l0cJbr5dX@debian>
 <CAHk-=whR8T1x6DRnOMJsorajT3A-y9+j5Mpeh0zcUXcJiJWheg@mail.gmail.com>
In-Reply-To: <CAHk-=whR8T1x6DRnOMJsorajT3A-y9+j5Mpeh0zcUXcJiJWheg@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 6 Oct 2022 20:55:03 +0100
Message-ID: <CADVatmNe49ZSkqX7E7K+GEk3crybRaAyz0nDwh_rzjkR51GegA@mail.gmail.com>
Subject: Re: mainline build failure due to 5d8c3e836fc2 ("drm/amd/display: fix
 array-bounds error in dc_stream_remove_writeback()")
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Kees Cook <keescook@chromium.org>, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 6, 2022 at 8:39 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Oct 6, 2022 at 1:51 AM Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > This is only seen with gcc-11, gcc-12 builds are ok.
>
> Hmm. This seems to be some odd gcc issue.
>

<snip>

>
> The fix *MAY* be to just add a '&& i < MAX_DWB_PIPES' to that loop
> too, and then gcc will see that both i and j are always 0, and that
> the code is unreachable and not warn about it. Hmm? Can you test that?

Builds fine with the change you suggested. Here is the diff.


diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index ae13887756bf..51571245c49a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -520,7 +520,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
        }

        /* remove writeback info for disabled writeback pipes from stream */
-       for (i = 0, j = 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++) {
+       for (i = 0, j = 0; i < stream->num_wb_info && j <
MAX_DWB_PIPES && i < MAX_DWB_PIPES; i++) {
                if (stream->writeback_info[i].wb_enabled) {
                        if (i != j)
                                /* trim the array */



-- 
Regards
Sudip
