Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F46BBBBD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 19:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436BA10E2A9;
	Wed, 15 Mar 2023 18:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF1510E2A9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 18:12:08 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id y3so17218348qvn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 11:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1678903927;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PS5OB3AO5CNPuv7NYq4FqsiUlkdNQVwkaY5HT7lJGkE=;
 b=bFcK1BVVp+Fpmx62ppND1CCgS30Nof0np8KQcOy5IwENwvc4ZHxk6oVKnu01TssBc4
 Y3CuOpANJjRF+ciAo6WX0LrExb3onjgODmH2L23lV7cHe7h31wGOFQw5Q1+Bj+VEx8Mb
 etj6Y18ekY2Rcl9UUtQMUnwgoacI2SzmSETf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678903927;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PS5OB3AO5CNPuv7NYq4FqsiUlkdNQVwkaY5HT7lJGkE=;
 b=tolI+LKjPgR6RfAKAUgmYcEO13IAxAFhyEuUIUQNgJxDgrubenFgRMQ8FGUmR2ybdQ
 U97dM7/kH6GiGCNRMXIF6U+FNYUCGswKNElPpwAFpk6LC9V+zfT9gmv9IHdlJr6jLY6w
 XskQyOVO+PYJQhHCIQNpxurn+5OQk28u3yojY1NxKBuhBfo4pYzVzhsSOOQDTxL1x9lW
 DW2fL1Pq+Ffj3KUX/H5sAjrj7ezYLKe9tVz1ViEduBjcLBXrRVaBGOxxiH/O3VcmX7JS
 BroivCy7AuSmvRvmLcuLCJokEvQq2YJTSwB9Lx9m8GAhbBqi8uw0QeiiRn9LclnPZPTp
 Zu9g==
X-Gm-Message-State: AO0yUKW18Q9RlXAlh1JyRMmQHxxRcPmI9OHOFJX7e0PYioaOpPwj1kS5
 YRUy7UAO9ex0PaVsHiGix3z8sQ==
X-Google-Smtp-Source: AK7set9rrNpfb0/qEWxFOnB6R5Sm+ReQx329l+TzH4ao5UaiZyCVwdLD9M7+YcA+iA9IRzAmUxnvDg==
X-Received: by 2002:a05:6214:130b:b0:5a3:79cd:8ef7 with SMTP id
 pn11-20020a056214130b00b005a379cd8ef7mr27365952qvb.23.1678903927652; 
 Wed, 15 Mar 2023 11:12:07 -0700 (PDT)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a05622a065400b003bfd8e2ab40sm4299551qtb.16.2023.03.15.11.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 11:12:07 -0700 (PDT)
Date: Wed, 15 Mar 2023 14:12:05 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: Re: [PATCH 1/2] docs: process: allow Closes tags with links
Message-ID: <20230315181205.f3av7h6owqzzw64p@meerkat.local>
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v1-1-1b83072e9a9a@tessares.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v1-1-1b83072e9a9a@tessares.net>
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
Cc: Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-doc@vger.kernel.org, Thorsten Leemhuis <linux@leemhuis.info>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, mptcp@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023 at 06:44:56PM +0100, Matthieu Baerts wrote:
> Note that thanks to this "Closes" tag, the mentioned bug trackers can
> also locate where a patch has been applied in different branches and
> repositories. If only the "Link" tag is used, the tracking can also be
> done but the ticket will not be closed and a manual operation will be
> needed.

We will soon gain this ability on bugzilla.kernel.org as one of the features
of the bugbot integration tool (which is still WIP). So, if it helps, I
support making this a recognized trailer.

Acked-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

-K
