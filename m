Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A7FB8C5E3
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 12:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B8710E2B4;
	Sat, 20 Sep 2025 10:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="JGtH06Rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 546 seconds by postgrey-1.36 at gabe;
 Fri, 19 Sep 2025 22:31:31 UTC
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD8910E231
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 22:31:31 +0000 (UTC)
Message-ID: <4a0bb60b-e3f0-4fce-8622-02ebeb374210@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1758320543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qdn6JbPiCcC2JrSnnuBVjmN1kD2fzIMN5v5TkpaM+WM=;
 b=JGtH06RmUhHwJPMIDikVH2yW3nlzgZcEJKmu5O2KIbue4QO2WUp7vWx7Hum10YDP3rRApn
 s7jSYbAoZwjP7jtRD91W8xV9lw5gmFM0A0qKmw9sprNxbXbDcBhBJiy6CUqfkDnMbr6Bfn
 rEpGZofbZ8g3bZFXze7Q34wh4u5fa/7SwNZgOfmrzNS7UtdJ95OcyogBALmxG9DWNUXEN3
 TJ9SNmirL6z3/8xKS4fLAWyUkBvwb46DcycD6s02U8p6Hm0ulyEDLR2t239ZZSbMCzL8FS
 gX2l9XQCmi+Tc6Ong+4sOm1MLonqK5nWX+lmp6yRmJxqnqzgezQj2yqDDknTAQ==
Date: Fri, 19 Sep 2025 15:22:16 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] Add LG SW49410 Panel Driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 phone-devel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>
References: <20250915-judyln-panel-v2-0-01ab2199fea5@postmarketos.org>
 <272d8cd6-e151-4bab-b8fb-438182a575be@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Paul Sajna <sajattack@postmarketos.org>
In-Reply-To: <272d8cd6-e151-4bab-b8fb-438182a575be@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 20 Sep 2025 10:49:23 +0000
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

On 9/19/25 7:45 AM, Neil Armstrong wrote:
> This patch hasn't been reviewed, and anyway the subject is wrong, it 
> should start with MAINTAINERS:
> please fix ans send a v3.
> 
> Thanks,
> Neil
Is there a rule that a driver must be reviewed before getting 
MAINTAINERS? I'm a little bit confused by your message.

On another subject, I'm testing the touchscreen, and think
I may need to add more power management to this driver in
order for it to function correctly. So it might take longer
than expected for v3 to be ready.

I'm pretty new to contributing to the mailing list and probably
sent this a bit prematurely. Apologies.
