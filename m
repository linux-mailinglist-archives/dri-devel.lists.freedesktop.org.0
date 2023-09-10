Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 282C979A55D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 10:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6596110E15B;
	Mon, 11 Sep 2023 08:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635BD10E09A;
 Sun, 10 Sep 2023 20:43:05 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-76ef27a8e4dso243499085a.1; 
 Sun, 10 Sep 2023 13:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694378584; x=1694983384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9msZ5DbtmGekV4G9H997JGWjDCJ9TtwZbavZxL9DMMc=;
 b=Ws4kA8DDL2E8lIb98YEvMhF1EV7TV1x519is+nuJJX2zQ95XwU/GLgxmxqN+Nlkq6v
 qNSIBxWsI66nHFRYyBZX5rz4WfB8JjgTyBTN6ANjvj/of0zeLlmeaU4M564OUy8Ez8d3
 sDVDY5HhzLGnOgQiOc/R21rCnfLoM+SHN74RH/tSkNzmV3ozRQzkEdvLIE8eQDlrc/m9
 dant51Vy7i1Mn4R7n0n5XWecnaTMd45ZaG6+AYxz8i4b1DB+33KQCwrCR6Fz0JOqKkyM
 GKpP9GdTgM+DWeqQyMZ0NK3m+LJ/STIQPnN3VIr34HLPdX44yHKrj2+jsOBuyEyzfVwz
 NYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694378584; x=1694983384;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9msZ5DbtmGekV4G9H997JGWjDCJ9TtwZbavZxL9DMMc=;
 b=eq1EX/wUaCG/JVjC35oHRk7QQbIbQFCJq2hPBIRHHA52ApkhME5DKwODbiK656iUVN
 T55rIYWMKZnAUXTlsbHGjbDV+ynJVjc0LOYHBvla3Y98AWwWJplCD33xhQkl4Rl+LxQH
 or6LkSgTb4tQf1n8gyTemXpTwFccGsTKTXhPB6HAGqMmMTN03wBczxnk7q3PjaKSP09C
 7Jzga4voo9ho89FikYBya4uI/4Cx+nhid47JNFrC8OlHDhDBkhlAYJL/lPdW4dmbLQPZ
 n7pzjC/E1LRQsTENzIFeK16Ytd4sD68+sPAFqmbi9PtECSC3mmjuoJkjWERM6jNh95wD
 evqA==
X-Gm-Message-State: AOJu0YzBTJwe5lQ+W2bwmdvgIMs63XMogXFEAwkORj6otILeSNzNzKas
 GxgvaDGwgGqUtqhiVixtlg==
X-Google-Smtp-Source: AGHT+IGFD46wMQVTSgKn/nRK0+OF5Uj0+a2n5PrWm4+i0yeQVx8oqrj3HKfG4ybkZzKzbEaxQ/+V/g==
X-Received: by 2002:a05:620a:4316:b0:76c:a673:5271 with SMTP id
 u22-20020a05620a431600b0076ca6735271mr10659649qko.24.1694378584265; 
 Sun, 10 Sep 2023 13:43:04 -0700 (PDT)
Received: from ?IPV6:2603:6010:7a04:7681:ad4:cff:fe30:e67?
 (2603-6010-7a04-7681-0ad4-0cff-fe30-0e67.res6.spectrum.com.
 [2603:6010:7a04:7681:ad4:cff:fe30:e67])
 by smtp.googlemail.com with ESMTPSA id
 qz8-20020a05620a8c0800b00770f2a690a8sm1208073qkn.53.2023.09.10.13.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Sep 2023 13:43:03 -0700 (PDT)
Message-ID: <d32d6919-47cf-4ddc-955a-0759088220ae@gmail.com>
Date: Sun, 10 Sep 2023 15:43:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: gregkh@linuxfoundation.org
References: <2023083119-phoney-ascend-d4ec@gregkh>
Subject: Re: [PATCH AUTOSEL 5.10 13/22] drm/amdgpu: install stub fence into
 potential unused fence pointers
Content-Language: en-US
From: Bryan Jennings <bryjen423@gmail.com>
In-Reply-To: <2023083119-phoney-ascend-d4ec@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 11 Sep 2023 08:04:25 +0000
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
Cc: sashal@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, stable@vger.kernel.org, Lang.Yu@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is also causing log spam on 5.15.  It was included in 5.15.128 as 
commit 4921792e04f2125b5eadef9dbe9417a8354c7eff.  I encountered this and 
found https://gitlab.freedesktop.org/drm/amd/-/issues/2820 while 
researching the problem.
