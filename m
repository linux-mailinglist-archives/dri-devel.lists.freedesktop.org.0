Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28CCA18289
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 18:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1959710E606;
	Tue, 21 Jan 2025 17:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dfah+RR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6609910E606
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 17:07:11 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2156e078563so78148275ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 09:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737479171; x=1738083971; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zLZ1M91Tz5+90Z8EdtBju3QcQgjWi+pie1RGDIf4/y8=;
 b=Dfah+RR1v2j+KcAWv94Dt7FUbWl9rOcWzWRyQGoLOEsJ/imPFuN7qolbfvMFXy7iVz
 xD4wnfkmN+ZFx/3Mds2vEiEzvLBE3lZYBC8PVyDCql+F1mjaO4Y1KyyEV8jb6LRirGFZ
 0y+iOvJn5XIzwQRtBYsGkKcnOkNDUJK1zylJ19mmCqBEEmni7VjAgE5F5qlGklhjEp/J
 Oz/203pgjTVfFlanrwjKWBF87/mF6sPlvDiqBo0k8/hUrF4YXZIYvCMEb9FBPQszuRMT
 ukbN0QfzANJDXY7W/9WIk7F2jmxt25El4tzSgdGh4iiqHYeHa+NlyAwqKAnIavSlCNDa
 b1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737479171; x=1738083971;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zLZ1M91Tz5+90Z8EdtBju3QcQgjWi+pie1RGDIf4/y8=;
 b=Mf1Hvgm9oaNnNv0aGqymFLSLLTVxc41CwqtSj9k5NWiOTX+7GNpESpNwOd1mo959hT
 bIlNR8Hfipu3ZNMPUw6xmdMtXvmOo7hFHuOlhCFrHPq3blwBuozpQZXL0CyD7kJHGoDo
 EBPiNnXMNDqsvFyrqBAKjEmXCk8Mk9GoWMKjz+V/HOpz/Fddg8XlUWH6DqF7hazIeLNX
 XIDJAU/37EmeNiYqQmympGE1fdioewdLZBoCkTC74O4NlAxM/KWkob8eL/KDOhJwKBkg
 /wKGFbms3XojUPgSJpL7mqG8gQPA6kEKTSoqMFl/+N1PiDqYGTWHEFf0ZqOklZuPZRiC
 ugNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1oX9Kh3JgKw+mrPjVQAiJkP0d+NWZvs+KXwoPDSOJaJhWUy+4wmHS1ZAmoW6T0i/pfjCmlHqAsEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNdKSDMfH7DliLQYKGNTPO3I8jDQN6JjdjqabhuK0bhVdLLoWs
 fdmxa1dFa6AzQA5eH+LKUwdpSMXV1FnXeXbIrHtbQYWx6HJpUnafjrhLBcxRVg==
X-Gm-Gg: ASbGncvi2lPCWds2SB6WfrLVl/us0howPYV7hYfwCxxxNad5K/ep4/QW5Q2Ubn1S6Uh
 NR6bW4AG+2109g0wNkh/Snh9dG3RPrJVPPEtUJHos2SNcBBzA8/+9JJUo/JV90q3f9lYQ7QgTOx
 53CaS59DZbtpu4RLP2kOzuGU64MM4J/7Qwzx79kayynTN5X09bpBnbduCldSGKhazPRQtc0QNLN
 EbUFQNqnchXNs3YtyKNW1n6rGyaJiveTDtVtkauOzEB2s+fAJ1LTC64xSlgzHIolrWA51y1icVl
 KuvrnBs=
X-Google-Smtp-Source: AGHT+IHn9TYsLmD7P0Ha+IDfjAk5r1UYZLHtwz2kbDOobhswOY9mYpBT9qI01ULKC2BhTtnxTxy1sg==
X-Received: by 2002:a17:902:f546:b0:215:72a7:f39f with SMTP id
 d9443c01a7336-21c355b78f5mr265880945ad.36.1737479170859; 
 Tue, 21 Jan 2025 09:06:10 -0800 (PST)
Received: from thinkpad ([220.158.156.135]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3abf17sm79278015ad.148.2025.01.21.09.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 09:06:10 -0800 (PST)
Date: Tue, 21 Jan 2025 22:36:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
 quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
 ogabbay@kernel.org, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 7/7] accel/qaic: Add AIC200 support
Message-ID: <20250121170606.ribist6ayw75bzlv@thinkpad>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
 <20250117170943.2643280-8-quic_jhugo@quicinc.com>
 <20250121051624.nhest7s6iyh2ll4m@thinkpad>
 <dbf3e688-d7fc-06ab-aee6-3ed1095148c8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbf3e688-d7fc-06ab-aee6-3ed1095148c8@quicinc.com>
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

On Tue, Jan 21, 2025 at 08:29:32AM -0700, Jeffrey Hugo wrote:
> On 1/20/2025 10:16 PM, Manivannan Sadhasivam wrote:
> > On Fri, Jan 17, 2025 at 10:09:43AM -0700, Jeffrey Hugo wrote:
> > > Add basic support for the new AIC200 product. The PCIe Device ID is
> > > 0xa110. With this, we can turn on the lights for AIC200 by leveraging
> > > much of the existing driver.
> > > 
> > > Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> > > Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> > > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > 
> > Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks for the reviews/ack.
> 
> Do you have thoughts on merging the series? I think I could take everything
> through drm-misc, you could take everything through the MHI tree, or we
> could split the series by tree with a phased approach.
> 

You can take the entire series through drm-misc. I don't forsee any core changes
to the MHI host stack next cycle, so it should be fine. If something pops up in
the middle, we can do an immutable branch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
