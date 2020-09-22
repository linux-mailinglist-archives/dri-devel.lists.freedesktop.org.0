Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E80327479A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 19:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD688929D;
	Tue, 22 Sep 2020 17:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2388929D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600796389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOvZa58bQwSg9zZxQrzzDfDSI+YPZEHlTilezlciasI=;
 b=J/ePqRWkxR2jNiCG1+/BoEj+j8n9VMqrInmusJzWmI2BAA//FXhtGuavuaOyEfNJKyn1Dl
 T4OrifbQnLqcLkIWIH9odzW733UyF6IJ1FhqQF9uZc5b4zu8hFJLMyYjOnsOV1tS3slzcR
 zOSFJ9aCVr7ufxkARxyoj9ZMfXCYbpE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-81ZLVN0IOd2FFzJUPXaeOQ-1; Tue, 22 Sep 2020 13:39:44 -0400
X-MC-Unique: 81ZLVN0IOd2FFzJUPXaeOQ-1
Received: by mail-qv1-f71.google.com with SMTP id l1so12043787qvr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 10:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=EOvZa58bQwSg9zZxQrzzDfDSI+YPZEHlTilezlciasI=;
 b=OyPXIYOHmFvEmAd1SyAxt9v0C8/cZ0R7XbyTVqTS53dcXQlQ3nFPc+yZ2G8kBO/ixK
 H3FO9s2Cf7/uBuNCzfxI7b9+9Cg0VT6jyr6F8e+4U0WUvn/0JyDDbaLeJaqZPG3T2dL7
 fv6k9RNlYRnR3g3fVqhgX/erOP/XWO2B85MDtW+7fqXWWKdWQBrJ4C9TxXzzI8H5HcE0
 YmEjQ/NqtmrvjpI6pddlA6YoCTmLbo/oMHg90gT536oIBXKG236NIzbPETmaStPto8aN
 B6Trf0hHrzfELhAJNvVyqkRl27FvERSegEMglpKn+hsRpV2s1o91z2an3Yeil21IV1Nx
 Uv4w==
X-Gm-Message-State: AOAM532xxIE+/YBp6OzJA0jCimyAzPy7o3XWLMJMHan5YsihFNRDdVk3
 K/Am8NxeoXhTESAtzGfg9sG/tkroaAEsLxaMK0RUQO0BMpnou1FbCpgsKgPolZbw05bTdCusDto
 BpxVvnb0bw7ZXba+fsfjmLNKeLobl
X-Received: by 2002:ac8:37bb:: with SMTP id d56mr5776235qtc.222.1600796383808; 
 Tue, 22 Sep 2020 10:39:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZKmhFVNxcmIKWH3PdQ/839r2qc0cP5cXBSbUPc3Oje/ERMJ7b6/wgKScyuW5Qim8DezYHrQ==
X-Received: by 2002:ac8:37bb:: with SMTP id d56mr5776210qtc.222.1600796383565; 
 Tue, 22 Sep 2020 10:39:43 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id v30sm13285520qtj.52.2020.09.22.10.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 10:39:42 -0700 (PDT)
Message-ID: <a2c0d1ac02fb4bef142196d837323bcde41e9427.camel@redhat.com>
Subject: Re: [PATCH 0/3] Fix Kernel-doc warnings introduced on next-20200921
From: Lyude Paul <lyude@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Date: Tue, 22 Sep 2020 13:39:41 -0400
In-Reply-To: <cover.1600773619.git.mchehab+huawei@kernel.org>
References: <cover.1600773619.git.mchehab+huawei@kernel.org>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Cc: Jiri Pirko <jiri@mellanox.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Francesco Ruggeri <fruggeri@arista.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Taehee Yoo <ap420073@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Cong Wang <xiyou.wangcong@gmail.com>, Andrii Nakryiko <andriin@fb.com>, "David
 S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For patches 2 and 3:

Reviewed-by: Lyude Paul <lyude@redhat.com>

I'll go ahead and push these to drm-intel-next-queued (since drm-misc-next
doesn't have these patches in yet, and the commits these fix were originally
merged through drm-intel-next-queued anyway). thanks!

On Tue, 2020-09-22 at 13:22 +0200, Mauro Carvalho Chehab wrote:
> A few new warnings were added at linux-next. Address them, in order for us
> to keep zero warnings at the docs.
> 
> The entire patchset fixing all kernel-doc warnings is at:
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=doc-fixes
> 
> Mauro Carvalho Chehab (3):
>   net: fix a new kernel-doc warning at dev.c
>   drm/dp: fix kernel-doc warnings at drm_dp_helper.c
>   drm/dp: fix a kernel-doc issue at drm_edid.c
> 
>  drivers/gpu/drm/drm_dp_helper.c | 5 +++++
>  drivers/gpu/drm/drm_edid.c      | 2 +-
>  net/core/dev.c                  | 4 ++--
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
