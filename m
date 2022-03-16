Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E14DB90E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 20:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EB810EA47;
	Wed, 16 Mar 2022 19:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FA310EA43
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 19:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647460233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IULt7o04qvCwavoveFrjEv+6PMDAGbABDhR83fNGGMs=;
 b=UxJRYjThLLuOG1U58bwHlMDsEi/9LoamwLs3H5jM0Ljak2iQZ+DuLkEtHepfHxIlef2TVK
 vT6wwao2As8W3py+8GLC+KrdCXFvsuD7cTp/QAcl9ui2i11SWycZ7Sl+lSECOU3Ml+cUBr
 YNhcz7REC9geRyWntCocSJRG5mQUZzc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-kBWFqRreP3KuLw4ac4YvYQ-1; Wed, 16 Mar 2022 15:50:32 -0400
X-MC-Unique: kBWFqRreP3KuLw4ac4YvYQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 x16-20020a0ce250000000b00432ec6eaf85so2426173qvl.15
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 12:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=IULt7o04qvCwavoveFrjEv+6PMDAGbABDhR83fNGGMs=;
 b=eUrG1jwCnpVhEsz7OK0YroiRyA/8krQNNOG1NHUZnfxTV39TVDU4voYX1TLHw1KlFv
 9PrFPg9HZS0nny9xtxEp6BhSOV6V+zZuYL5g0yIALPuyXcsAtl7VJj6n+iR+POGozXWV
 zqBz3XYkBxJkBKHAtc93M+zx3nrD6lJ5f46XBoX4UWKniT7w5arN11wxAKeaBuTBIcgg
 ANgjTYqsP3gr5NNTWeNDKT+OuKwdtdhP/KWYR5lWcXAnbCoEWpqAqLfFlfl/vbXBumB9
 s3kP3AXn/TAcjPtUM+liuP/EJiX29b6/yW1l8lSlciNt9sUTl2FwCkjRlYpwAbh2NkTq
 UUvw==
X-Gm-Message-State: AOAM533ylQvBdoyqKaCjCd8uciP503lxcbRi47gIh4cd7Xu/CjABdBZW
 mGUz+8dvOL2LZJ/5kWpeAfFOYMNfNI0XCVKF7Iy7L5Vtgsfxp4WSrZsngjMQGKWIzOdfFxiUBMq
 qN32vCeWfEVNk+FbfXQ9oVO55lLt3
X-Received: by 2002:a05:622a:15d1:b0:2e1:e43a:5d8f with SMTP id
 d17-20020a05622a15d100b002e1e43a5d8fmr1272100qty.140.1647460231605; 
 Wed, 16 Mar 2022 12:50:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh4lpEBRc4yxekchAYCkuCPJHbF3ageo0B4XggIr5OARMmH3VDkNNZctHxN64Hf6q3V4ltsw==
X-Received: by 2002:a05:622a:15d1:b0:2e1:e43a:5d8f with SMTP id
 d17-20020a05622a15d100b002e1e43a5d8fmr1272083qty.140.1647460231386; 
 Wed, 16 Mar 2022 12:50:31 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 v129-20020a379387000000b0064936bab2fcsm1320346qkd.48.2022.03.16.12.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 12:50:30 -0700 (PDT)
Message-ID: <2cbea441243bce09ec11bfe19b5bc2a727b94690.camel@redhat.com>
Subject: 2022 X.Org Foundation Membership deadline for voting in the election
From: Lyude Paul <lyude@redhat.com>
To: xorg@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Wed, 16 Mar 2022 15:50:29 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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

The 2022 X.Org Foundation elections are rapidly approaching. We will be
forwarding the election schedule and nominating process to the
membership shortly.

Please note that only current members can vote in the upcoming election,
and that the deadline for new memberships or renewals to vote in the
upcoming election is 31 March 2022 at 23:59 UTC.

If you are interested in joining the X.Org Foundation or in renewing
your membership, please visit the membership system site at:
https://members.x.org/

Lyude Paul, on behalf of the X.Org elections committee

