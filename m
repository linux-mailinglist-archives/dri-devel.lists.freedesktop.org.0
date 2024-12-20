Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F67C9F97E8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 18:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B113910F008;
	Fri, 20 Dec 2024 17:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MSNn1fMq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21D910F008
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 17:27:39 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so1519575f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 09:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734715658; x=1735320458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
 b=MSNn1fMqxJO4L4QLAj09v32Ouiqnzt9yNWL7f9AVtL/ViM4bL9p22oY0gi1eN0yXhv
 oioQpiap2WK4oY3Akp1XemQ+Cj7GctPPhcc0IhJlaZ7uaCxgMVyoMdt40ARbaVmpNwR6
 m0wpaoPLDaisAosdWiHMDSkneGQwEvhIF6jTOvwzVFTy4lxEvTE9sNpGoI/wsgigLADa
 ImPZGYAYrh8RRxKmQEM7xW8d8u8DkI7paxjSsHA2B/ckxKzmaYfi4oaKoS0aaPOdmasI
 VigCJSJRazbUrOGQQ+IWhfKJYMWNFmYAPqjuHdNkmJwIb6QehUuWt2MfQXVrobRuiogU
 6s3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734715658; x=1735320458;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
 b=m/vAxKtlxt06qBtn3Z3lxQQezH3PhFf4jhNiB2dM+qm+1rPvAe85+sNFJi7xgpr0/R
 iHW2crmfMAZpgdwudJNutQdICMrGxeeD/KTzfOjgIOX+TsdUeWUsmKwLE70cBGZOmfpf
 9QEZgN2F3qvvFhEVdsHmv1hFeplopfEBhMrFHDgggle32UFB/M4ojDVpygYksRbHE+6r
 GX90ShYz+SK4Jc9cLPVH3Oz75c9Et9x97G0sUxCCbO598aUO0QrzK1clEa6yiAmbcfSk
 o/jHu2AEI22MeTVdiFtegIMIebltTPtCFCaoQCHG3XbHEiocywAoLkbjoP1P670Oayqq
 QZHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYrUWA1y0lCkhWT1/wY668FbIa+I/aI9ih70738cop7oFCOseRHUYfZyd2n8bLkG4VDjhcMMTB8Xc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr2UfmE63xrxyrjlCPEwzb0KBc5DShTkxk0HGfX1IBm+XyHJmb
 dbbTOWCWeecaxpSOlIw0G6bQOplciuoJzKFNFWXSJ6J44p1tSf3NJnfhKvDJrPo=
X-Gm-Gg: ASbGnct9P7NEByCttp7vjNL6haavdaYbIN6jjrLd+FcOAtefvW9Dqs3W1Qe13nJAWQ2
 eOcNNRlR9Dt7AG4Si/n5O2OQowNJ7/ln/P485AFGSARyJFyaq4LrQxtp+kDFytSVm4Rk5tY7cbA
 nqmosUNkTMkTEUzvfRdGJjqOF4vI5mBWaw3nsfesxOD1aEj8Er6xIqPmuBgVOixjed78Q0nJUY0
 6UB5UfBSTI+Bz6MrC0ePA9K8ks1Y0HvT2cyY1e9JmAyd0C85p46sZAntbMccwZqdHiXuh8XIU8=
X-Google-Smtp-Source: AGHT+IHQofl14bIpVpiQqz6qAEwAjKsEmWVjRCOjis6wH9jKfvKMjWLHCbYlsDgmYPDOjR7ci+Y7xw==
X-Received: by 2002:a5d:47c3:0:b0:388:cacf:24b0 with SMTP id
 ffacd0b85a97d-38a1a1f7253mr6745803f8f.2.1734715658179; 
 Fri, 20 Dec 2024 09:27:38 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e357sm4642915f8f.72.2024.12.20.09.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 09:27:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, audit@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-usb@vger.kernel.org, linux-mm@kvack.org, 
 maple-tree@lists.infradead.org, alsa-devel@alsa-project.org, 
 Sanyog Kale <sanyog.r.kale@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, dccp@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, 
 drbd-dev@lists.linbit.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-leds@vger.kernel.org, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org, tipc-discussion@lists.sourceforge.net, 
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 linux-trace-kernel@vger.kernel.org, Neil Brown <neilb@suse.de>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/35] Reorganize kerneldoc parameter names
Message-Id: <173471565665.227782.7244101246430956449.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 17:27:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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


On Mon, 30 Sep 2024 13:20:46 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> The misordered cases were identified using the following
> Coccinelle semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> [...]

Applied, thanks!

[31/35] slimbus: messaging: Reorganize kerneldoc parameter names
        commit: 52d3d7f7a77ee9afc6a846b415790e13e1434847

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

