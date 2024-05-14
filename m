Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0C58C587D
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 17:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E95D10EA16;
	Tue, 14 May 2024 15:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I66tDyWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CD610E3BC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 12:34:46 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6f47787a0c3so4950247b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715690086; x=1716294886; darn=lists.freedesktop.org;
 h=content-transfer-encoding:subject:cc:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iLMMeOBA3Eom7Y04MlDJcn0Vz6uRZ6HEs7F9rDlmuvQ=;
 b=I66tDyWyCFTHBxdkR7c/jlAFumzTqEHGKLwaSkVZ3uK/bXNxpiRaRlnUoqZnCkTn5H
 aFCQ3Aw8VTcLmmMSZSUcQqQHiChmfPLgyhkk8L+SYU+ReoOArydO+JNHWqRRIqFJXJo4
 JVTo0rAQ3i3IiCjQj72vKFgLXZAXVRBAw65brR4CNjCcPnuqUiVuGqRdlt8k9ZOwX9Bu
 K4j2ZJ0qFYvsIyxVqBH4txMYtXWRPjgvfRo4UinvNctQbUenbD+IS00KC1u5T0hcaIDg
 /Edoh2W+GPzPLg2l1pTmf1JqVqBvEpxnyB/JFKxXvms0q1dEhncPcOPfgO0ue1Pq0VSm
 sSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715690086; x=1716294886;
 h=content-transfer-encoding:subject:cc:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iLMMeOBA3Eom7Y04MlDJcn0Vz6uRZ6HEs7F9rDlmuvQ=;
 b=LSpr4z42uYT//6OaD3pt51kLS4r0sKljbgp2moNikSRXmKsl1rNUoxA7ii7ZEIQHDR
 tBWNieDkjJDTLDFtPDZjvOKBxVbgng4hwK+jZxPHViIOp4pgMji1nMqyB+Xf/xr1eW2N
 dGQd9GV410+UXF4oWNrIoWvY7cSTGfZiuKDyqP0ARcUA+0E5b7OOXghRXReNyx/xBhpD
 zNty5U+0oAGHCyn/cliYh5EsivPOowfh7pepYX1JapA9YOqGVbX1Jms08c+V0eSGea6H
 XoOBtWQkCgmcYPnIC9L4tYSp+mYAd9x9ICt3eo1P7tHVOrqi/peUKE3PtR6WP4h2YjML
 vBoA==
X-Gm-Message-State: AOJu0YzCVm6tOa4ZXhPSg0BNwt5BWtA2PP92oowfyi1qB67/BkcELTXe
 9pwAI34+ZrtNjkTx4PIz4c8wC960U9sHee9mwYQjxa3bZKRqS7Ls6qdllcgXeUs=
X-Google-Smtp-Source: AGHT+IGcBuAMmpcDkrdMvpzHqIVCcDFq/v1udaRWj0uEXkMqi0r6cCOX7VXyOXDghCIll3E0MQpHDQ==
X-Received: by 2002:a05:6a21:279a:b0:1af:d228:ca5b with SMTP id
 adf61e73a8af0-1afde0d5488mr13849253637.21.1715690085703; 
 Tue, 14 May 2024 05:34:45 -0700 (PDT)
Received: from [10.0.2.15] ([106.222.210.243])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6340a447429sm9353569a12.18.2024.05.14.05.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 05:34:45 -0700 (PDT)
Message-ID: <e5c0a250-8c91-4523-b980-5b0e13749616@gmail.com>
Date: Tue, 14 May 2024 18:04:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
From: Manas Ghandat <ghandatmanas@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: drm: Remove driver dependencies on FB_DEVICE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 14 May 2024 15:09:06 +0000
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

Hi. I recently looked at the todos of drm and found the topic 
interesting. I wanted to get started with this issue but having some 
trouble identifying the devices. What would be the right approach to get 
started?

Thanks,

Manas

