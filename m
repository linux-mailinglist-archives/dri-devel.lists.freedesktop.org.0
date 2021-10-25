Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CAB439DE0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 19:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC646E194;
	Mon, 25 Oct 2021 17:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4FF6E193;
 Mon, 25 Oct 2021 17:48:32 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id t2so11012530qtn.12;
 Mon, 25 Oct 2021 10:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=BtGwZQqLyeVwRyLLA+/DNrTsbJxo3+8snfh+L6EC62U=;
 b=LAU7hD3JnpAvimCobygD9XG+nRmWpHXniwx8U+diKkNeqHlabzmWd0wZhjdlM3070C
 S+bTamCCvvTMDD2rLpF9ZA/0nCuoziMrdN6C+D0ZCzWcXG9WN3ccbdC3F6zINpa1i5zH
 RflF/oO+fMkySTXCv/4LPUEO9NtKNUk4oAK4dopmLC0f2NOyKcNeV3D0cbU+v16+3dzJ
 UlzzVjdnwzZutzzu8hdSzJ3LLDhoLz8ElzNOkp5cIiYJFqv6nnEePb4tH5swJNq73LV5
 Oc0vzfrHCxYppB37EFmKUbndcoTlV8WX+UUqT1fPektPcZIlD9kSmwVw0szCzuajBHyC
 BqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=BtGwZQqLyeVwRyLLA+/DNrTsbJxo3+8snfh+L6EC62U=;
 b=SaXK3WhmKm6KhMn6YqTJG3e3N3g7WGDiwO7rDw0Gbf4WtJ013y7GTzIIW+b91P74ov
 PGLthKDyj/5fnOy4jNvwF/zQngp3//l2vuLIjucDFvo3mzlyp6ZDGwi8rM8IinD+DDf1
 vvq+knNyeAKWwlvO2dI1iskzTOLqDdONrvO5OG4+6p32aujBmdkhBxQu17CZSmD7E8qr
 fILaayh4+slTjvgELaH04tKP44JuGGfOc0cM0ML7v7bDUmurvKvI6ZUClslIvbTsJ/BL
 ngvJNtFPW+rBr//sAYxLamHQiZ0tYFvUWU8mKzVQ1Dc6rp/GCQ1ulcflQr4ZndxB6+LL
 90tg==
X-Gm-Message-State: AOAM5307Hf4Y+igvJpxF7JLwwoLVB1N7KIV/QpH+rBBVstpafWM3MQDK
 We8u1+bNDZYc8w3UayEOUSU=
X-Google-Smtp-Source: ABdhPJwh/n1YYJlQQKIVB13OFFINIC3PNTATpXpZHYja3ycyvORcSOD0T6e184TZreDJliFoYGwJRA==
X-Received: by 2002:ac8:610b:: with SMTP id a11mr18965953qtm.182.1635184111176; 
 Mon, 25 Oct 2021 10:48:31 -0700 (PDT)
Received: from mua.localhost ([2600:1700:e380:2c20::49])
 by smtp.gmail.com with ESMTPSA id v21sm512169qtk.46.2021.10.25.10.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 10:48:30 -0700 (PDT)
Message-ID: <f43cbd18-a0ef-a029-4f3d-28c9f9d27ad1@gmail.com>
Date: Mon, 25 Oct 2021 13:48:29 -0400
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
In-Reply-To: <b412bb59-8f60-6b4a-9bc4-e606c6b9f66a@gmail.com>
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

> sbios settings

any of these raise a suspicion?

screenshot from the ASRockRack X470D4U's BIOS setup:

   https://imgur.com/a/rdhGQNy

