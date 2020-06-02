Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8795D1EC0C4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 19:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FA26E430;
	Tue,  2 Jun 2020 17:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4066E430
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 17:13:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so4144696wrn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 10:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YVdBis5rDas0mNmyilXMdSt2BqsSAYSk+S7NMkcMDGQ=;
 b=HSrQ6dIp7nh3U1I3LfFmu+xVui5aXxeEwnZVcRiqidWelqBeZflaS3KoY7KABufgKD
 jHnUsV87euR2DChIrPqk7d89Yf1FyPurbGNA6Yj4wulNEoRRQBm06fC4thn9pvS7rGvo
 V/tMHhmeE0UIRCGinB29VBuJBx2JMYEBdhWcwfl0xMT6d41dr1tkVrJyynPrAZVAzMOB
 PtijMJ/+Vh61GfT8XXgjosvYKZjDfVfAQhCppFTEGjVN3sEobKx17SW5vp8Tp4muj+b4
 UBj6ahR5V0Xm/nFYZHFmXzNG1lOOWDUflzMGFHairbmb6XkOYUsOlpkSt6rCbkWqIhc5
 vMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YVdBis5rDas0mNmyilXMdSt2BqsSAYSk+S7NMkcMDGQ=;
 b=StT1sfmWJaBkKo//nFTnU7nZzSCHAVR1FE9lOZLceBHAY47fRjZBx/T9R7DK/lSjc9
 yRBmzpwZvvt3H30vv1PW53Uw2AhXaFxN0Lch1At7uq4mK4y7P+14qm9UTdn+301bZn1I
 p7LHx7ouaOuR6qlx3/MmH/AWX50JX2TUKxYbrd4vin26sXFE73tSdyfm9Vb6+sWbCESN
 dQIx9LFumczxUQcblCwBDbCSAib+e24ptEUycfwbvl0QhhmHIsQsEAy1d3INyWUERNVG
 V6FwjtxVibt3saSXVDOTiTUX5y1ToUJHwA3BhTSOhOA+IXZhS+nUB/lXqvm9nJ06/SqY
 tVkw==
X-Gm-Message-State: AOAM530sICepfcW5Cqyr6vTnMlWcq2aa/GuxnKXCfu0JQJc1acmPeBeo
 zrVEG4EbPTS2+ormQswjbciT7xIJ
X-Google-Smtp-Source: ABdhPJwfnbleweXW9xsqR16VTe1cH5GNFTRej6DJ+ivel2t8ZMd69yo9yFTo6tnzbhOnXsuhgyLdXw==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr28177877wrp.338.1591117997914; 
 Tue, 02 Jun 2020 10:13:17 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id 40sm5055266wrc.15.2020.06.02.10.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 10:13:17 -0700 (PDT)
Date: Tue, 2 Jun 2020 17:12:57 +0000
From: sylvain.bertrand@gmail.com
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [BUG][AMD tahiti xt][amdgpu] broken dpm
Message-ID: <20200602171257.GA310@freedom>
References: <20200601114925.GA1626@freedom>
 <CADnq5_OwF7PRqCrPmAYJzxLG-Hv80z4Jv0JaDPMqS3mxqra5FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_OwF7PRqCrPmAYJzxLG-Hv80z4Jv0JaDPMqS3mxqra5FQ@mail.gmail.com>
User-Agent: Mutt/ (2018-04-13)
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bisected: commit 4dea25853a6c0c16e373665153bd9eb6edc6319e

drm/[radeon|amdgpu]: Replace one-element array and use struct_size() helper
...
Also, make use of the new struct_size() helper to properly calculate the
size of struct SISLANDS_SMC_SWSTATE.


regards,

-- 
Sylvain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
