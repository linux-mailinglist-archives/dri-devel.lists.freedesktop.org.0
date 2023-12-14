Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9707812CF0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 11:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E299310E11D;
	Thu, 14 Dec 2023 10:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5D510E09E;
 Thu, 14 Dec 2023 10:31:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3363ebb277bso1102819f8f.2; 
 Thu, 14 Dec 2023 02:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702549897; x=1703154697; darn=lists.freedesktop.org;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pLYkJnJXd81g51cIVyhAsIiPmUBe4PKYI60TVdps6BA=;
 b=UpgPPRcyY3jIqP30tyIeUOj43WZ2G91XfyneUOFVjhmf70F2mdEiJHA6tvvLo5L0oj
 Eepg+k+uEHwwlhRsLbwVUm9qQRNQ10JgQtxw2JHzOZvQJ5ZMGHVnCdsgUs+YHUSS4gxP
 q3/wZ2u825cpCjiDAUdF+bPBYuN6fkvZfDwCnHsAR38sFM3eOgSZGukvGZKAEAVgdxwe
 9hymBHt+Vyq+qggzCR1KWBQgw58QhhV+BsrNdXoecwpjMCEN3WLkpqBCAz4jgc36skGk
 gvtSuQJxsVD6xsI7xwoZiYn+B4Yy/Xogu9F+s86uAa1Lj9xZwKf0pL1poxlbQHx+QwtQ
 nyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702549897; x=1703154697;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pLYkJnJXd81g51cIVyhAsIiPmUBe4PKYI60TVdps6BA=;
 b=Zh2924jgSdncEspA6ZtDk3y3MKKAUmqHoJKjrsdrLrQrgjJ6jUpTsZZcOgwA0brHAS
 BK9DbO56Dxu7mEAmxXSQNSnjdQbzRnCgmpBUZYN2mP5rMA8vL/EOfc6newJO0Xoh5TVw
 yO1zUWWkkdw/r8tt9Vi/r/zxy/6CENuhZcE4Okgn7gNabal7xLiEgESxm59V3+1k0e2q
 7cuVOHzYEsPW1oREm5LLZwj4VvrtXgINYtETGR24MXeEQq3rgYzBNv3KSd5K3kRsD0UP
 rMdMrRgMyiQ4a3XrKl2GzBUQ1QJ8TIkQc8OsCl3LgKFOoA82zrOz6/95NsnYGRpieiAl
 GRrQ==
X-Gm-Message-State: AOJu0YzOTJ4udFJx+PMqh4K/YsSr7uSZSaGDjj8lEu5qCMdmkpdYqyje
 TBWFWqKj9G85sQEtXrMyjM4=
X-Google-Smtp-Source: AGHT+IHqvSCkYo5JHFgUqPsD5mgCuoK+F9+KcMfU0Hr/XVqtip7bt8H8dmGWZRwLHv/7S1YKUx1QUw==
X-Received: by 2002:adf:e40a:0:b0:336:352e:59e7 with SMTP id
 g10-20020adfe40a000000b00336352e59e7mr2367183wrm.48.1702549897073; 
 Thu, 14 Dec 2023 02:31:37 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 v23-20020adfa1d7000000b003364a5d1d20sm760865wrv.16.2023.12.14.02.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 02:31:36 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------850I555jbRoKUs2OoN505GX8"
Message-ID: <b2db43bf-d89e-49ab-8cc3-588de5db5c1d@gmail.com>
Date: Thu, 14 Dec 2023 11:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
 <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
 <d30b7992-5c39-49f5-889c-c31d4994a5c3@amd.com>
 <CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com>
 <473652dd-8ca1-436b-aa52-eb85eb0e98df@gmail.com>
 <381345a6-64bc-4cda-b787-fc431827b289@amd.com>
 <86b95faa-fda4-4354-97bd-a1c15fed0771@amd.com>
 <8316182c-1b28-49cf-97ef-23c683c1140b@amd.com>
 <1aeaa28b-1929-4c35-9225-fade0a25987f@mailbox.org>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <1aeaa28b-1929-4c35-9225-fade0a25987f@mailbox.org>
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, amd-gfx@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------850I555jbRoKUs2OoN505GX8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.12.23 um 16:46 schrieb Michel Dänzer:
>  From a security PoV, the kernel should never return uncleared memory to (at least unprivileged) user space. This series seems like a big step in that direction.

Well please take a look at the MAP_UNINITIALIZED flag for mmap(). We 
even have the functionality to return uninitialized system memory when 
the kernel compile option for this is set since this is an important 
optimization for many use cases.

Regards,
Christian.
--------------850I555jbRoKUs2OoN505GX8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 13.12.23 um 16:46 schrieb Michel Dänzer:<br>
    <blockquote type="cite"
      cite="mid:1aeaa28b-1929-4c35-9225-fade0a25987f@mailbox.org"><span
      style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">From a security PoV, the kernel should never return uncleared memory to (at least unprivileged) user space. This series seems like a big step in that direction.</pre>
    </blockquote>
    <br>
    Well please take a look at the MAP_UNINITIALIZED flag for mmap(). We
    even have the functionality to return uninitialized system memory
    when the kernel compile option for this is set since this is an
    important optimization for many use cases.<br>
    <br>
    Regards,<br>
    Christian.<br>
  </body>
</html>

--------------850I555jbRoKUs2OoN505GX8--
