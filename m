Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED2C7C042B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 21:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04E510E3D8;
	Tue, 10 Oct 2023 19:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601BA10E3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 19:11:28 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-534694a9f26so2683a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 12:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696965087; x=1697569887;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UhWPPtavJHzLAPYPA+MixCb/WnkmoReo5Jlg6WhyMY=;
 b=e9CETFAKIjzSKXbEdSw8OQAlj7pATVXodsBV50NqpSQ5NvxNvkQN+TTiK/I4eQUWCt
 COB0/KyBg8dsAgHzhdOdOg12Ba8S71DCUe+ZEZN+sxelb3Vhb+HJWG1Je/ofhyI0s3nH
 z45M0p/+0OdBS/ApWfOKcXxZ88WxrT+X2RnDiF/bjFTvo36XSCNobJ0fXawb2h37Tith
 EwrPG2ffso6VFsziWHfMtcL+E+bkrpThFqA7E73LjKrBIRKEz8NoCIuzHW9chPDPVxTE
 AhxWQ2Yyizwb+wojD8QZr04tPR2YFwfaznI54hSczer4eJZ6tAunOuvGIX689AH24JTi
 GfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696965087; x=1697569887;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8UhWPPtavJHzLAPYPA+MixCb/WnkmoReo5Jlg6WhyMY=;
 b=LHf4a8X98FaxQEw+pOz1osIrHt5PWblNYZFT2GIT5Hmi25Gl0Ra/22C8PPsFVrzoPP
 XNz688dLrJIXnf13RcpX1gT00Tf89rsjlnzyzPydpPjDl6d2SUU9is9kqy47U/PCYxcK
 baljS1a45TlaGrXgj9nQamUxJbzAkXo6+EDsoQP6Q+oKX8WiIkpl7KMVnMlhYvhFmWVW
 N9A1Ou7/LLq8Nme7iZyiBtIxq3fI8dL+g+y+xbcA+2o9Pi+g+G9JtOYBoZB6HSpsCP2z
 8bhruJNmO1NfEOBwzrRBMxgskg5sOwoW+kmpsMd4xh3LycKyUWjkyVPqsap5hytb/T4B
 bOgg==
X-Gm-Message-State: AOJu0Yw/P7T0QVT6gb8iMFfOIATVhMJj7SrOUUbB5XnQC2rmtKj8gzvS
 HK3XGQfRUIeClFfIZ0ZuFgE89NwCj6zFUts5K+ivlQ==
X-Google-Smtp-Source: AGHT+IG3iu4lDDQxvxjKVyXKAvsUtrHzYogEnV9JAMPz8LTFaFQJBRNy+ua8NBMQYnzwgvmcL0rlz26idEroMAGFi5U=
X-Received: by 2002:a50:9309:0:b0:538:2941:ad10 with SMTP id
 m9-20020a509309000000b005382941ad10mr23380eda.5.1696965086532; Tue, 10 Oct
 2023 12:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231010121402.3687948-1-yangcong5@huaqin.corp-partner.google.com>
 <20231010121402.3687948-4-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231010121402.3687948-4-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 10 Oct 2023 12:11:14 -0700
Message-ID: <CAD=FV=XFYyMRBoAnWuu-x4_qpKwVNR2-kLera73cwnu==DZkVg@mail.gmail.com>
Subject: Re: [v2 3/3] arm64: defconfig: Enable ILITEK_ILI9882T panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: neil.armstrong@linaro.org, will@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, catalin.marinas@arm.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Oct 10, 2023 at 5:14=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Enable ILITEK_ILI9882T panel.

Could you add a little background? Maybe something like:

DRM_PANEL_ILITEK_ILI9882T is being split out from
DRM_PANEL_BOE_TV101WUM_NL6. Since the arm64 defconfig had the BOE
panel driver enabled, let's also enable the Ilitek driver.


> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
