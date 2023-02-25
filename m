Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3B6A268C
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 02:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290FE10E064;
	Sat, 25 Feb 2023 01:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D0F10E064
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 01:35:44 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id ee7so4387335edb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 17:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6y2kSPi11D0yTP/isu7pwaO4frgXiHyKw+zLPrXRqVM=;
 b=IvpJMeRLy7eCQbaNJP4QFWyxFshYi5gHXU8xW1Vu7Jo8yW49OS0sGaxOffU8IWxP3Y
 qKzEEHePIVR6TjcCcAJzHG7PHotdzLUrMRp9+rJMUUjm5I6TdJd2HFIKBSpZI9itKeBP
 e//jzGwMNTEHXZzPMRbkkxCc/F5owBIFrDYno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6y2kSPi11D0yTP/isu7pwaO4frgXiHyKw+zLPrXRqVM=;
 b=b56ozKSKmOFShcvlZVXvtwxGHEvNVI6uVM9Q1lbMtD2QxcQojZ1k9ye95fZA/UScK8
 dxE53oiTlXZmkK58wlmjAMQr03zCcpzwCy36n9relq+N/rkNlyA66R5Mb55foEGNOoXf
 9UiR9ZjQdw0lBA7naHHN5iqaRBo1H0hRI8difp53r9aDVmCVTBOEdosX5JRhFShm+gFx
 3HBq2q7tqf5NQa4XxaVN4/Lrz/hD05uolUshGOL9X7iW4YevWdfzJjYPkXPOQD1Fz4Pj
 gQdaqmR8ELE9j0DxKGopHSRp1MZc38DuKMvXyXorn7vPR7IwXo8uRNoy24ZNGKE71I8M
 9HgA==
X-Gm-Message-State: AO0yUKXVXoVzMFdgqA66zaJi9QRKP3wxRG8dI243bgxuwaWAM4RiYBMi
 y1aJejZ6gWKwCrahh3Yb6njF3L8bXCoeFYOXOXrMHw==
X-Google-Smtp-Source: AK7set913+7+UNQD4rCv8wVyl+U89wbWEWXSgNSSYBHtUV/JRjgZtB8VRTe6DkVYB7ttmUOZZRT4Lg==
X-Received: by 2002:a17:907:76ea:b0:88c:6345:d0e7 with SMTP id
 kg10-20020a17090776ea00b0088c6345d0e7mr23823380ejc.36.1677288942139; 
 Fri, 24 Feb 2023 17:35:42 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 x2-20020a170906658200b008bfe95c46c3sm220728ejn.220.2023.02.24.17.35.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 17:35:41 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id o12so4232030edb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 17:35:41 -0800 (PST)
X-Received: by 2002:a17:906:40cc:b0:877:747d:4a82 with SMTP id
 a12-20020a17090640cc00b00877747d4a82mr12237781ejk.0.1677288941207; Fri, 24
 Feb 2023 17:35:41 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txhVJ3t_3-wMdWH7F+=_BbW19NYxAnm2cceP2uHR47_5w@mail.gmail.com>
 <CAPM=9tzPxixXnRuk0Jfs2ESw-eY43H_e5_FtGbxAhRmvaByYwA@mail.gmail.com>
In-Reply-To: <CAPM=9tzPxixXnRuk0Jfs2ESw-eY43H_e5_FtGbxAhRmvaByYwA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 24 Feb 2023 17:35:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj4ShzDcZVx07ObELz06dL7m3Ax-p014rAmxGQ3D0brXA@mail.gmail.com>
Message-ID: <CAHk-=wj4ShzDcZVx07ObELz06dL7m3Ax-p014rAmxGQ3D0brXA@mail.gmail.com>
Subject: Re: drm next for 6.3-rc1
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 5:30 PM Dave Airlie <airlied@gmail.com> wrote:
>
> Any issues with this? I get nervous around 48hrs :-)

It was merged on Wednesday evening. See commit a5c95ca18a98.

If you were waiting for a pr-tracker-bot reply, I think you need to
put "{GIT PULL]" in the subject line for the automation to trigger on
it.

             Linus
