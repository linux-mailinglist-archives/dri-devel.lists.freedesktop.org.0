Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084839EA525
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 03:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD92910E372;
	Tue, 10 Dec 2024 02:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="gltUExJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F9D10E372
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 02:35:28 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20cf3e36a76so43671175ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 18:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1733798127; x=1734402927;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lbz6GgQcGGgKxUmPwve7mlms7Sw5WCPX8VZSPrMbRug=;
 b=gltUExJpR5vgOnGZQLHR5o3XqUXFGEDtxEsY7Z5DjhE2KclohxqZgPJ5LD4i/mg1u9
 ReW5P4y8j0k03RfY2LV02p1cGHPkPIkAQxRa9PULHideNrUGsAOrksBMViNH9vOL9hEm
 7IOC2LYJRIXEj8Wq9PZ/tFE0ssTXljHYjhkYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733798127; x=1734402927;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lbz6GgQcGGgKxUmPwve7mlms7Sw5WCPX8VZSPrMbRug=;
 b=Jqth4pzwSP1N869U2e1RzRWxaddUsQ9cHKWp0QL00+AhVaPEd+7tV3PV1RXLLoq6bR
 IU4bNBR9P8D5GRtPs+tjrFVa5pMC7DvbN9JOtfyuIIjNWjZFH7ibOV2PiyrOc4qn0xqt
 t20b68UjIU5mSAtprIvG0vKQUTyy7VSwEAKL0WDwhBaU2Jp1W+uZfmmu53zMevmmVlz1
 x3HVpFxZ6qWzh2AXT13ioceMEKebievgNdBXNZyCVA9Qh8uDQC0BiFX5FrHhLVgGOf9A
 hLjBtdoAKVxCc+exwPS0hmbJZUrdrmr87/bLQwe7ngZPDUgX0rbsNlqnIfnA4cjxHmYw
 6S2w==
X-Gm-Message-State: AOJu0Yw4LUb/ZA5aDYE2Vn5QvANXV2EGH+yDD4tu2u57MIy4egWZYfug
 eV9DlEoHQKuUxs/KUXl+k0i6MzJsR1GayO2mhjyD1lYei9alIWzwOylJZNp1cQ==
X-Gm-Gg: ASbGnct7pmgWipcxIcuL+Xh8yxPVxsnlQfCtjMmaw72hbKy0pdQIJAm7K24ELadnKcK
 OKB0F/Oa68Ffk5H4tpTq1o/0vIKoyi6HXVOgw93aiMpATGnnQj6p57bHyB32H9JxHmHptVGYayB
 bNvj0XcObpc5FnQf575iB3QwsDbkQAnZQfD45W61L+VaqjJQBiUR6rfDjKk6N3daxlsf1BRHZVS
 rpBKgfCL51JxIvaJkSNmA1df9EYw5ULYGALUNMn404gUJ8w97sPioQGt52yXJO164Vbxl1lreb+
 tG9t9gVbiCIr5cnKC4c=
X-Google-Smtp-Source: AGHT+IFB7vxgKfpeoxWBpWlhV9HFWHEZ+pfFGafn2O1bBjpO0ek3O3PwxbU+bYJccMXERnA3wIY12w==
X-Received: by 2002:a17:902:f602:b0:216:282d:c67b with SMTP id
 d9443c01a7336-2166a03d552mr48670035ad.35.1733798127590; 
 Mon, 09 Dec 2024 18:35:27 -0800 (PST)
Received: from [10.211.247.102] ([216.221.25.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2163f688d65sm32736895ad.170.2024.12.09.18.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 18:35:27 -0800 (PST)
Message-ID: <76e79296-ec07-4dc5-9389-266a4aa9d9a4@broadcom.com>
Date: Mon, 9 Dec 2024 18:35:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/vmwgfx: Support hw_destroy for userspace
 managed surfaces
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 ian.forbes@broadcom.com, martin.krastev@broadcom.com
References: <20241018210046.2222313-1-maaz.mombasawala@broadcom.com>
 <20241018210046.2222313-3-maaz.mombasawala@broadcom.com>
 <CABQX2QPnOvN8FXK34OU7=zAMtE6wZAwostuHKzzenQ=RCG8+eg@mail.gmail.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <CABQX2QPnOvN8FXK34OU7=zAMtE6wZAwostuHKzzenQ=RCG8+eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 11/19/24 11:46, Zack Rusin wrote:

>>  int vmw_cmdbuf_surface_define(struct vmw_private *dev_priv,
>>                               struct vmw_sw_context *sw_context,
>>                               struct vmw_surface_metadata *metadata,
>> @@ -2484,6 +2522,9 @@ int vmw_cmdbuf_surface_define(struct vmw_private *dev_priv,
>>                 return ret;
>>         }
>>
>> +       res->hw_destroy = vmw_cmdbuf_surface_hw_destroy;
>> +       surface->cmdbuf_destroy = false;
>> +
>>         return 0;
>>  }
>>
>> --
>> 2.43.0
>>
> 
> Hmm, this looks like a hack. So what seems to be happening is that the
> reference count on the resource is still active. When vmw_resource
> reference count goes to zero it should call hw_destroy, which should
> invoke vmw_gb_surface_destroy which should delete the surface. It
> looks like the reference count of userspace resources is off, so with
> this patch we'd be destroying the gb surface but the vmw_resource is
> still alive. If that's the case, then what we want to do is fix the
> reference counting of the vmw_resource rather than working around it.
> 
> z


I have looked more closely at the resource refcounts here. In case there is
an error in surface creation, then refcounts were not being freed properly, this
is fixed in v3 of this patch series.
As for hw_destroy, I have put binding the hw_destroy function when command buffer
gets committed, so it only gets invoked when userspace has not submitted the destroy
command. This also fixes an issue where if there is an error in command buffer checks
and the surface create command gets reverted, the kernel still registered hw_destroy
function and submitted a destroy surface command for the surface which was never
created on device.

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
