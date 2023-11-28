Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B29B7FB21F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 07:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5211810E429;
	Tue, 28 Nov 2023 06:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3B510E42B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 06:51:12 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6cb749044a2so5139617b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 22:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701154272; x=1701759072; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uBQiDTGElGC/iQuipJvaEvquIy+irMHsbVUaQJuQwC4=;
 b=JD4bDGev3PwmEonu/Q789FtKjcADJOs6M5mE9INTyp7kv+Vyc4kwGUv7o6vV5Nfuag
 Q4vmA2fNpyY+jAyQnVljJ6/3jTsjf8u30LzxfqoRCnTMRL+9m+FYK7sTeY8yiyjkkktw
 fIC+ZusbqbSpZY1J+4aD+rW0BDzQfz1uM5OK7b8XArCrag6OX0C5q4cdk/gwta27D8ZN
 vi3Hd96cs46xD2L0JKheWgkW/XjDFP9OGardECiOoOa+hKJCa3gigWgbTa8KjEpVhq6z
 cWw+2ZZ1z7GRl+MMTYQUq6Lncfm874kDqgqXYYYBYqt3alx2NB1Q3eGsVBrowXHFSQrX
 /dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701154272; x=1701759072;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uBQiDTGElGC/iQuipJvaEvquIy+irMHsbVUaQJuQwC4=;
 b=vYTZMT0wEcWFa1p3uiDZxlGLy8iKp4x6+q/DKMIjd1j3/ijg2MWGEurkzbg1QpaPkV
 q/M9f8CXa0rdGAZrhb0NeXDZpsbjO5AQNwyA//2kqEIWFEhpRcU62JPLfd6/8rpxODta
 GBt8Qlql0wCxVzb6OFaLrZkalBhvICTIcKXd+ElfWsO8UuYa/Rnkh+EBIFa/p4/Cbd62
 0Mociizrg6OCzIgMJoEGggAc09lKFdEq3F46TFsAbXsHBlXzrSN86KIV/jiI4ddLSnAT
 l/p4FFXRIUj8YpAf2o4VHeH1SUQhRVKCMMtUi01QlKjcZaBs/RbjSLmu5jM2K7/jaECC
 KvRg==
X-Gm-Message-State: AOJu0YyDxUPP3i/bTsiqjB2GJyCEG1yRDoeHJUvNq0ueawQ7DHJLNC91
 xkYpfLuhkaMmcy53NK4LajpD
X-Google-Smtp-Source: AGHT+IEnvI4ydDHNEQqF42I/aL26b1A2O/ZB/+msey5Q3lR6xnG7ljDsBqZEJiYNuUCIne2HrUUoPA==
X-Received: by 2002:a05:6a00:a18:b0:6cb:8a8a:4bb6 with SMTP id
 p24-20020a056a000a1800b006cb8a8a4bb6mr16162259pfh.11.1701154272009; 
 Mon, 27 Nov 2023 22:51:12 -0800 (PST)
Received: from thinkpad ([117.213.103.241]) by smtp.gmail.com with ESMTPSA id
 m22-20020aa78a16000000b00692cb1224casm8293437pfa.183.2023.11.27.22.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 22:51:11 -0800 (PST)
Date: Tue, 28 Nov 2023 12:21:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Re: [PATCH] PCI: qcom: Fix compile error
Message-ID: <20231128065104.GK3088@thinkpad>
References: <20231128042026.130442-1-vignesh.raman@collabora.com>
 <20231128051456.GA3088@thinkpad>
 <50a9f061-e1d3-6aca-b528-56dbb6c729d9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50a9f061-e1d3-6aca-b528-56dbb6c729d9@collabora.com>
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
Cc: daniels@collabora.com, linux-pci@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, helen.koike@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 11:44:26AM +0530, Vignesh Raman wrote:
> Hi Mani,
> 
> On 28/11/23 10:44, Manivannan Sadhasivam wrote:
> > On Tue, Nov 28, 2023 at 09:50:26AM +0530, Vignesh Raman wrote:
> > > Commit a2458d8f618a ("PCI/ASPM: pci_enable_link_state: Add argument
> > > to acquire bus lock") has added an argument to acquire bus lock
> > > in pci_enable_link_state, but qcom_pcie_enable_aspm calls it
> > > without this argument, resulting in below build error.
> > > 
> > 
> > Where do you see this error? That patch is not even merged. Looks like you are
> > sending the patch against some downstream tree.
> 
> I got this error with drm-tip - git://anongit.freedesktop.org/drm-tip
> 
> This commit is merged in drm-intel/topic/core-for-CI -
> https://cgit.freedesktop.org/drm-intel/log/?h=topic/core-for-CI
> 

Okay. Since this patch is just for CI, please do not CC linux-pci as it causes
confusion.

- Mani

> Regards,
> Vignesh

-- 
மணிவண்ணன் சதாசிவம்
