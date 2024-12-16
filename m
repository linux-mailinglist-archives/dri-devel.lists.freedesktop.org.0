Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5572E9F3E3F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 00:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E6810E633;
	Mon, 16 Dec 2024 23:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fsFeHhbk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFC610E633
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 23:31:18 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso5383382e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 15:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734391877; x=1734996677; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0myHXndV0qV5Q6G/Mq88Gi+ACvREZlQwsyRsJV9SPdQ=;
 b=fsFeHhbk6NGxfVzJgPjHjhkjf0ADu24vo6PxHHWRKepim+M6FiNViwkAEulpMLAd7a
 OvTWLKHAiOtATNfQms6SP8m13u6cYsjUekcBWNf0M0iFy+U+4PVHOD6dVhJ9xAHwmkSl
 lEK4zDrx8ErJKKp6F+akeVKi4+zgNUm5hq9j0SV8M+weBs1B3d07rRfjCJDPNN5vq19X
 upX6kDWfTPaOWIyoTF+E+IPMc5n9dWy4EhYlaKTM5dokkwkC68A2823jBoQ1VW/PMFZN
 Q4oa/W3bFUO8vZBhZlnc6Q+0dqsowNSDXBlrOPEb/35c1f6uQaxdekj5xn4G/t9uFHKE
 m/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734391877; x=1734996677;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0myHXndV0qV5Q6G/Mq88Gi+ACvREZlQwsyRsJV9SPdQ=;
 b=fzAEiyl6QBj5ohADT7Nuqm8ajGGdnDLmP6jf1NJPJ92qL7s/Vvh1XoFzhOBtkLqN7x
 87Cvbk4gj1O5jKxeCKHFVCwZKbPy/fG2aW+xJslwziI+0KLnuw0DqX5TsnvuC/ByRwh+
 4YFEqlUeBkaQF31966zqF1oyfPzWuJBCNMiYY5Ft+pPUZfs6zyg3l0TVDhKXcVgBvzxh
 PPj9ek5cmuZmMlzSspi/d7knn3XGdHbkRf7SEWb+njqMwqW6qVZaGz3TdztlHY2tgN2m
 hoM7tdSLLrJO6jutnbRfJsMFk8P4leAaghT8bMLFL9MF1r2eYQHiCvv7Tk3gQpxf16e4
 z9Xw==
X-Gm-Message-State: AOJu0YzgHVL4Lk/oNYVL4LgQPVe8hmgi7uClTK/fpUyFov2AkJK/5E9Q
 OU7QERA8Zv0b/r87j7YvZuWo30bmJxgOlR9p+9rwtPl2bnru0USbQYAb9ngDTJQ=
X-Gm-Gg: ASbGncsC+Rbm0tHowl6OAL9JWpECu8gcmNC3TcSrzw6lBvgihAXnY2qkKpIJnY5oslo
 1rDuSQ83qOTjSXccqOjQlvgPyEFYbBIbsPpGdl+fjeW6MaSUeglT490BhmnpMCuXqjWdYl3RkJH
 B4B4SVOoJ0S5eTBQ4Yq3nZR7pDmxRSES6is4B3QIAmuw6RoYfe9fTNAva7+JPWAetUtf7ReBPsq
 gn6WHr+LPJiCJbjZmlAOVJIckXf7LwY2io6++OxY/lJwgkqEAjJS0wJwn7tOhM6W57U/rGUAua7
 5zVrsD1DqITWs9WHOqy6yJXkiOUJZfG5Fj+/
X-Google-Smtp-Source: AGHT+IEoifryj/0BI7jdLUNnQVMMdkVDQQGF3GziQCGMhBY9ZxZsOW20zlYILYcNKpUyZw0OESJV3A==
X-Received: by 2002:a05:6512:3b9d:b0:540:1dac:c042 with SMTP id
 2adb3069b0e04-5408ad82317mr4936022e87.8.1734391877205; 
 Mon, 16 Dec 2024 15:31:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c0038bsm974734e87.147.2024.12.16.15.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 15:31:16 -0800 (PST)
Date: Tue, 17 Dec 2024 01:31:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Derek Foreman <derek.foreman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, mripard@kernel.org, 
 kernel@collabora.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/connector: Allow clearing HDMI infoframes
Message-ID: <oqiyvwu5b44bqs47oulg6su2pid43mwa37jqd4nfpnpq36j46x@gghpkaebbaj4>
References: <20241202181939.724011-1-derek.foreman@collabora.com>
 <1d60edf3-1977-45cd-af10-e5085518afe0@collabora.com>
 <01020193cff2c151-dd394f31-4b16-44b4-a101-3db2003051d5-000000@eu-west-1.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01020193cff2c151-dd394f31-4b16-44b4-a101-3db2003051d5-000000@eu-west-1.amazonses.com>
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

On Mon, Dec 16, 2024 at 02:50:13PM +0000, Derek Foreman wrote:
> Just a ping - is there anything further I need to do here?

I expected that the patch should have been reviewed by Maxime. I'll
check if it's okay to push it with Angelo's and mine reviews.

> 
> On 2024-12-03 03:45, AngeloGioacchino Del Regno wrote:
> > Il 02/12/24 19:19, Derek Foreman ha scritto:
> > > Our infoframe setting code currently lacks the ability to clear
> > > infoframes. For some of the infoframes, we only need to replace them,
> > > so if an error occurred when generating a new infoframe we would leave
> > > a stale frame instead of clearing the frame.
> > > 
> > > However, the Dynamic Range and Mastering (DRM) infoframe should only
> > > be present when displaying HDR content (ie: the HDR_OUTPUT_METADATA blob
> > > is set). If we can't clear infoframes, the stale DRM infoframe will
> > > remain and we can never set the display back to SDR mode.
> > > 
> > > With this change, we clear infoframes when they can not, or should not,
> > > be generated. This fixes switching to an SDR mode from an HDR one.
> > > 
> > > Fixes: f378b77227bc4 ("drm/connector: hdmi: Add Infoframes generation")
> > > Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> > 
> > Reviewed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > 
> > 

-- 
With best wishes
Dmitry
