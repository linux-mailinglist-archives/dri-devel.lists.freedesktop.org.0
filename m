Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A291243B7CA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 19:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06EE89DB9;
	Tue, 26 Oct 2021 17:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1FD897BB;
 Tue, 26 Oct 2021 17:02:09 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id u25so1736361qve.2;
 Tue, 26 Oct 2021 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=+kCusidYY/Kigw4ftDQLBs+PlH4mB+1cM/24vXCJmVk=;
 b=HgNNWuFRknYuO3AUAAwDk6ba5soZsYpdzAfnknEgBYT7GnMzW3Ul4K8Mzyl0BI9zn/
 GAF5+PecSml95WfMro/+jipaT5Riv5UybcmIKmIYebn4vRFaSZ3lhHg8hgfk4MzojRff
 ScbIeagh4z1dG/PHAWTbxQwSwRcj7rBLWGY2ArnrMlrEA1CjDgYLVq2rtz1S2PnyB7U3
 hj4o/78n4FdbdN4rMYItAC1j5OS6So4l0ZyzV1D2HtYAk2fnzjqoxXqZnfBI9w6XrbEm
 a75mlZCjv/lZbPpenq5oAmoeTXmwUZn4nmDaHZNfKZmjDxIczlqy61YrJvn02EyJiNQh
 UjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=+kCusidYY/Kigw4ftDQLBs+PlH4mB+1cM/24vXCJmVk=;
 b=vsaJ+1NJfIyZtAqYVem2iS84Bx6SgOQsQ9245P183mztQGmD4zJNmWLqU75///7KIx
 nFRL1jTDH7CKdzN4Z4hHx77SoFhbV5u9TokjNFph16UBHalIbLIJy2wcS6fOG6gEJllP
 Iu0+5blVeSi53H+gpqZ0Z1RrUJ/qWRD9mpzjSqEtK6pPwa1vLFHDLlztiDgg9TuoltkF
 GkWfCiFiUK3JXDvIRtH+mtEs/8/3OHWNb8kIt0cSGDsIAKlxNcUDix4uI1lyW4uHM2tS
 1bhhxtz+55GADQ2vpL5rDBKg539ZPt2E/hyt2OgDXvERQyo1hvPe0p8JvkWTK4U65FXB
 jOjg==
X-Gm-Message-State: AOAM531FGzZXNFz0A968Fq+Rnz4zHlxtk+84pMIsCDgMpufB8muGiGEA
 oNPpShRFtBBeXengBPtsBao=
X-Google-Smtp-Source: ABdhPJxSTvjNkJzA3GJy6o/CpUbyQVyIRfFOmceg6iZeOlIDk6Rg/WZzMozHLwVumS+OhI+UJzpfJg==
X-Received: by 2002:ad4:5dc4:: with SMTP id m4mr24475541qvh.29.1635267728425; 
 Tue, 26 Oct 2021 10:02:08 -0700 (PDT)
Received: from mua.localhost ([2600:1700:e380:2c20::49])
 by smtp.gmail.com with ESMTPSA id y9sm830659qko.74.2021.10.26.10.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 10:02:07 -0700 (PDT)
Message-ID: <9002fec0-f219-6804-9031-4e5cdfcbb5e1@gmail.com>
Date: Tue, 26 Oct 2021 13:02:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.0
Subject: Re: amdgpu "Fatal error during GPU init"; Ryzen 5600G integrated GPU
 + kernel 5.14.13
Content-Language: en-US
From: PGNet Dev <pgnet.dev@gmail.com>
To: lijo.lazar@amd.com, alexdeucher@gmail.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <b4adea1b-9a21-75d2-7ee7-25d4f28ef6f8@gmail.com>
 <2303555f-42cd-180c-7a67-1d104bceea7d@gmail.com>
 <CADnq5_PsKDreYH0aNNzfR_TbfMMsfVK=-hCCB0ThZ0PzcLPCpw@mail.gmail.com>
 <27b8936d-ba79-cc13-7768-692565bedc2f@amd.com>
 <b412bb59-8f60-6b4a-9bc4-e606c6b9f66a@gmail.com>
 <f43cbd18-a0ef-a029-4f3d-28c9f9d27ad1@gmail.com>
In-Reply-To: <f43cbd18-a0ef-a029-4f3d-28c9f9d27ad1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: pgnet.dev@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> sbios settings

given suggestion this may be a BIOS issue, I've posted this issue as a question @,

   https://forum.asrock.com/forum_posts.asp?TID=19749&title=x470d4u-p4-20-ryzen5600g-fatal-error-gpu-boot

and pinged ASRockRack tech support via their online tech supp form.

If anyone _here_ knows an appropriate contact @ ASRockRack to link into this discussion, that'd be useful/appreciated!
