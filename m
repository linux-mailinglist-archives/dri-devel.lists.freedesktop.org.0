Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33D56238DC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 02:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7579910E642;
	Thu, 10 Nov 2022 01:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED6A10E642;
 Thu, 10 Nov 2022 01:31:39 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id y4so310697plb.2;
 Wed, 09 Nov 2022 17:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ESGvSPPpnxewtL8pi4sMSmnNLSQrLzT7c9wFSP1Mtus=;
 b=NAYDx00fz3eoOTlewhQR7o4e751lSsrceQ0OUlTgFBSTpy8xTcHEAfiDCdzyJZLVcd
 zD7wypzeEKkJU31LVaD+rsGZ8S1xIrD4mdsyXlZFZTmfa8pJuT8X/lP8IyWA+rwYCxwZ
 JdBK5jGzxVFf8+6lkhqgy5wKz7rm8SuyxlpCFc7HM03Mp+7Cd55+dhUZbQE1HE+3yH0z
 thBlAKBNPGMRsOPfwlR1SaJhzw4NXJ3S+cnJyo/QjZkyu5++XS+JKXGs8ZtM+gMFwEgd
 UB5No4mfeslf0izpQwA2wj4mZwqG7BtkVdLQEeAJHlOykYUMhFTFHVO1jmzDQAu9Ob36
 N2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ESGvSPPpnxewtL8pi4sMSmnNLSQrLzT7c9wFSP1Mtus=;
 b=PU3Pe6Do/vfLVB87khQ7S5IBb2UZlJKGSJ8OU16q5TsqENDtOpefTpohVlP6iKflBV
 ZMUROTHNy/HavsxHOBJZ9oVK+X/NHS++qigXirBZjDUxo1qlApM//PmrmPUnh4xN7tvw
 aP4AtCQJmundp54VQzPqwT6HuOR+wtqAlXZOcpOKYu5oCHisRf1CQ+3AcsEjrAdgqTI2
 67DhpJkauoOvjUQ545ifmyTZnyloNWitMhLHDfOl0j4pcsqPofBZxKNg4qjkQ41BSP2G
 hcvCG+mq5j9KrHcCdQmBhZ5xMOv4FRS5nyQPPLX28nDIlgcwMBfXepJNoysp39OfoQ+/
 J2Vg==
X-Gm-Message-State: ACrzQf0KFttnoCz0uQTjxDe0aYtuQAp65QhH139fqJMHVm/P30sXsQrH
 KnbuRjEY5671bXwn73C8dtI=
X-Google-Smtp-Source: AMsMyM68UBlS9+k6pCVedRW0PWRn5b2sKHi5M+jsS5QYeObRwefSgCmbUAunNDc6lmtRrOn7Sn4ZWw==
X-Received: by 2002:a17:90b:3690:b0:213:c985:b5ee with SMTP id
 mj16-20020a17090b369000b00213c985b5eemr59252195pjb.192.1668043898772; 
 Wed, 09 Nov 2022 17:31:38 -0800 (PST)
Received: from mail.google.com (125-237-50-34-fibre.sparkbb.co.nz.
 [125.237.50.34]) by smtp.gmail.com with ESMTPSA id
 e17-20020a17090301d100b00177f25f8ab3sm9897101plh.89.2022.11.09.17.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 17:31:38 -0800 (PST)
Date: Thu, 10 Nov 2022 14:31:31 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [RFC] Approaches to deal with a struct with multiple fake
 flexible arrays members
Message-ID: <Y2xUc9Q/+zTYbjaL@mail.google.com>
References: <Y2siZmiTD40mTYpJ@mail.google.com>
 <Y2xJxUnDnesWYckj@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2xJxUnDnesWYckj@work>
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
Cc: amd-gfx@lists.freedesktop.org, paulo.miguel.almeida.rodenas@gmail.com,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 06:45:57PM -0600, Gustavo A. R. Silva wrote:
> On Wed, Nov 09, 2022 at 04:45:42PM +1300, Paulo Miguel Almeida wrote:
> 
> Adding Alex, Christian and DRM lists to the thread.

Thanks so much for your reply Gustavo 
Yep, that's a good idea.

> 
> > struct _ATOM_INIT_REG_BLOCK {
> > 	USHORT                     usRegIndexTblSize;    /*     0     2 */
> > 	USHORT                     usRegDataBlkSize;     /*     2     2 */
> > 	ATOM_INIT_REG_INDEX_FORMAT asRegIndexBuf[1];     /*     4     3 */
> > 	ATOM_MEMORY_SETTING_DATA_BLOCK asRegDataBuf[1];  /*     7     8 */
> 
> I didn't find evidence that asRegDataBuf is used anywhere in the
> codebase[1].
> ...
> <snip> 
> ...
> As I pointed out above, I don't see asRegDataBuf[] being used in the
> codebase (of course it may describe firmware memory layout). Instead,
> there is this jump to a block of data past asRegIndexBuf[]:
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1444:
> 1444:	ATOM_MEMORY_SETTING_DATA_BLOCK *reg_data =
> 1445:		(ATOM_MEMORY_SETTING_DATA_BLOCK *)
> 1446:		((u8 *)reg_block + (2 * sizeof(u16)) +
> 1447:			 le16_to_cpu(reg_block->usRegIndexTblSize));
> 
> So, it seems the one relevant array, from the kernel side, is
> asRegIndexBuf[]. I wonder if we really need asRegDataBuf[] in that
> structure... or if we could try modifying that struct and only have
> asRegIndexBuf[] as last member? and then we can transform it into a
> flex-array member.

I saw that one too. That would be the way it's currently accessing
asRegDataBuf member as the existing struct would make asRegDataBuf[0] point 
to some index within the asRegIndexBuf member (as you probably got it too)

you are right... asRegDataBuff isn't used from a static analysis
point of view but removing it make the code a bit cryptic, right?

That's pickle, ay? :-)

> 
> If for any strong reasong we cannot remove asRegDataBuf[] then I think we
> could give it a try and use DECLARE_FLEX_ARRAY() to declare both arrays
> in the structure.
> 

Out of curiosity, why both rather than just asRegIndexBuf?

> But first, of course, Alex, Christian, it'd be really great if we can
> have your input and feedback. :)
> 
> Thanks!
> --
> Gustavo
> 

- Paulo A.
