Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E547460BB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 18:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575CB10E084;
	Mon,  3 Jul 2023 16:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67C410E06A;
 Mon,  3 Jul 2023 16:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BiYigt7zYTuTfpoKc6uqrwZviUtVf5LAgZDNhGxhXA4=; b=YXRILy88wcvchL4Qn3p6zh+sZ7
 D732sKKK0mLOMPbBeqfJNF9enbwuVY++PhYphitoHulx7i3OL0JqnG4AZ3Ried/ye3jfohr0+lQwd
 1Dh/Tu0U/PQX23ub+qNoWMseUX2DdkKAT7GaHLKYyl13KR/2H/1kvl29aZk9RhZFtWXKKE7N0EjH+
 cJxtqfo3JV1sZP2AyX19btqLOhDlvlSTfI828gy0REnWIQCvL4/lT7ySZBrEOq0LBRa7Ko7Q3c1ab
 8JPBv6S4WBZwQXuzzTnXQvABSc69samyzuxr03iZHqDxE8ZrMysVNnZjkih5RmywgqAeo7FYZ+ALy
 hL2YU7Tw==;
Received: from [187.74.70.209] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qGMTo-007hfu-14; Mon, 03 Jul 2023 18:32:48 +0200
Message-ID: <5bc889d4-bccc-9d6d-fe35-da3e9627eaa0@igalia.com>
Date: Mon, 3 Jul 2023 13:32:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 6/6] drm/doc: Define KMS atomic state set
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230701020917.143394-1-andrealmeid@igalia.com>
 <20230701020917.143394-7-andrealmeid@igalia.com>
 <20230703113836.60869599@eldfell>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20230703113836.60869599@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Italo Nicola <italonicola@collabora.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, hwentlan@amd.com,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Em 03/07/2023 05:38, Pekka Paalanen escreveu:
> On Fri, 30 Jun 2023 23:09:17 -0300
> André Almeida <andrealmeid@igalia.com> wrote:
> 
>> Specify how the atomic state is maintained between userspace and
>> kernel, plus the special case for async flips.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>

[...]

> 
> If you want to take these and need my Sob, that would be
> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> 

Thank you very much! Your version is way better than mine, I'll use it 
in my next version.

> Thanks,
> pq
