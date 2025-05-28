Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0C6AC6E78
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDB810E647;
	Wed, 28 May 2025 16:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZoMLuWvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E55F10E616
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:56:00 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ad88eb71eb5so287023566b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1748451359; x=1749056159;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T9zftyONzu0MxcoYD44tY7ej2NBy3CRmkjGElcgv6+c=;
 b=ZoMLuWvg1Ee5QGED+k6EVpMmp818kEec0sNUnbv49Kwo0+M7AO5+Bd0Deq/P/JAWFk
 ORPk6eL2EtxcBGztw9gWc77d2CP25wa0RNrfzQKkPdnUadG4ol5Ado97ho8eqLQYusgH
 eqs+jUG1D7fXnmu2Jo4DIU3mvYAbpKbfS0kSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748451359; x=1749056159;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T9zftyONzu0MxcoYD44tY7ej2NBy3CRmkjGElcgv6+c=;
 b=BPBJyzLaR4Xy0uNt3OaL2RQaAyxnQypcRkey+qwaEmMIk3vnxavkHhQiiK0sy7VDTv
 o59Ogl8mr2FThdq9EDTW77+JL7SEjhdYs2JAaW+Ze60eGckgInUF3mTtF9CaCrrnccnK
 jkpeiAhJzmc4WRGHX7WX+aNug/9T/o3CkRPe824b0viHwcxTmZm+VGiDv8q3bXfzJ2Pg
 xIDqVGMWe2EWYtHFMkfwe7oKHbw9NaEZbMASm75rOttXpZMn2oGKzVptbFgdYWWQdalR
 IO+begI+mUBIpwzd0+1k8lJJ1H5HauJh1CqWg/rTGeq+FC88pjxuoocHCdlwGNx3XM8a
 rnvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTgOop24gn1BjdZ1WNPVLjsaeicA42qYc6wen22fI/EbsRs39FOmyjuMLxcwb1anv0qtpKw8TWNvc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsW2snsewwfY0jhHy3JdxoUqB0ONFv3YXlgJoLtAWB/F8hWfEf
 q8cTql/qbJDW7WhaVfSYTg+7BAS3Neq68ccxy6NBe//xvL9Ps6oIQz20Npaedzga4neYvLnHQJK
 5RnlOzD4=
X-Gm-Gg: ASbGncuOvPfZz06jIBpvJLYr0vEt9xsruPibj/mUUTWTGqxJipChARdzlpde3AeWumE
 K8/y4B1XQIyr5bgGoHNh3M2Xu7UUNmNnHkHR63GRWt1QVc+JnfmWIKhYWaj40TYuLm36N//rlf4
 T7Gnti7ODyl2SRziGsZtT1SYqniDXw8Y0LbbFV24G7au+Cwmrqm6ZotjxBMZ0vFxTkE4sK6ilwK
 063xu8qn2GOSPgSET7cS3qZbMRgLBXYt20y1K/GjLjGlNRPOiIfWRPg5lEBbjFvPSRceFHjRh7f
 EvDna6MwVP7yD2x8x8nh3+09VsZ3380f0bBZlvu6n3nMS5sd1AGpNuwMojRMie8vB8JiWG2tZZ2
 8uGQ+/yhS3AM1vQ2ByQ1VfntfHk2RHIzsgUAq
X-Google-Smtp-Source: AGHT+IH7Q0jIme0U7r0YFTewG3zGNFW8/CqDF4UXQ2pdLreiE7gmeZRIrIQGtIZKZvRp7z39Ry08Fw==
X-Received: by 2002:a17:907:3f1c:b0:ad8:8529:4fa5 with SMTP id
 a640c23a62f3a-ad885295437mr998353666b.46.1748451358744; 
 Wed, 28 May 2025 09:55:58 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8a19ca0d4sm137633766b.51.2025.05.28.09.55.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 09:55:57 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5fff52493e0so5941816a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:55:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHkanC9Uq2UoJ+90raqmGIDRLPMnIr1zj+cqN+tpxtVC7cvsrFYV4KYbbaQ0JzOQHXSO/LDatHeo8=@lists.freedesktop.org
X-Received: by 2002:a05:6402:2713:b0:602:2d06:6b19 with SMTP id
 4fb4d7f45d1cf-602d8e4f276mr13902719a12.1.1748451357548; Wed, 28 May 2025
 09:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
In-Reply-To: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 May 2025 09:55:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=whY4xa2jbwUxPb8hxAaRnqvrUQUNZst_ESzcUCmog7V1g@mail.gmail.com>
X-Gm-Features: AX0GCFsVq47usAFeSsFikWlaY95wGDZZ-D6yA0JKD_281NR-chPF1aQ_CKdAJJo
Message-ID: <CAHk-=whY4xa2jbwUxPb8hxAaRnqvrUQUNZst_ESzcUCmog7V1g@mail.gmail.com>
Subject: Re: [git pull] drm for 6.16-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 May 2025 at 20:51, Dave Airlie <airlied@gmail.com> wrote:
>
> I've put a trial merge result at
> https://github.com/airlied/linux/tree/drm-next-6.16-rc1-merged

I have trivial differences due to picking different line ordering for
some things, but your merge also left in a wrong (but ultimately
harmless) duplicate #define for LRC_PPHWSP_SIZE.

                Linus
