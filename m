Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEC54E60B0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 09:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB2D10E866;
	Thu, 24 Mar 2022 08:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D1D10E866
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 08:53:27 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t11so5577006wrm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 01:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dYsVFhCrdFzymQrW11VWatLy1IpiH7e9KgAVON6gbDw=;
 b=063VACslaS0QkYsACr4TW0iC0t4e+PNhn6Yyx34AqDoKkwGvGnJXLNe1ohXcWWBDIP
 OZFnAj2CheZsZEo+kcqH0g8dN1FePndHLe0XBS05hHNB85Ggg9mzU0N56RRRNVv8za2X
 kMu8qsWIokhYI/vf+Gwjg33CGkY52MYVEpai+fqi07rH3aRzuMmsnPi1X+oZrMZ0NBtW
 cjlj1r0KGSYfJADu/I2DiSD/U9P7CAqmiyc3H+0UxcyySfHo94GL74kLUvwCrlFpCfYe
 hND/L+W3MSIGUVVRB5TbGTm2n44KZRRnaIVHhQkRskNIkN2kw0UTaQ4sFPJOHeCd515z
 l7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dYsVFhCrdFzymQrW11VWatLy1IpiH7e9KgAVON6gbDw=;
 b=RZxC4+CBy0auNtlaloi9wr7XVb3OL7L7hFhJFZ+uwlbCztDborLOu83TkDmrTzRQIw
 I5uu7v5/eAw5GP+SoQ265z3zw4Kia9kJwYS3NRyy/qC4N1S19XTlXxINfMKXIGk6miTp
 PrqbvLuoTXjHYWBzJhmN6B3XGq8N8eHjul8PBhqgmpmHkWmZekg7Ix9Ut/Pcx6eRcH7f
 LOcp85eAxpDLVdFJjVSMCnayardRJ0olSrGw31/wvxC05QJuI7zOC7C9c2uKvwfkA6Mn
 z1lIGPGyHBn7ce/sDC4TV9/n8VxbmJtdiPcEr7m25Mdp0Rgz1JJ4FfZHuzg8R5wDlWVB
 Q26w==
X-Gm-Message-State: AOAM5337Zpn2WvwzgeH4lw6AM+8mbvNIpcyV09GEa3g1kZIIEnPn3+Xq
 fe8LjnY84OzhGQdpW3hIgr24aw==
X-Google-Smtp-Source: ABdhPJzKEKzpOf8nBNRu121896sO6b4YUiYtj9LnK0GChJVTz9htGZgmRX9zziTMIJWkkxjX7MvV5Q==
X-Received: by 2002:a5d:6c69:0:b0:205:8472:e251 with SMTP id
 r9-20020a5d6c69000000b002058472e251mr3662954wrz.227.1648112005283; 
 Thu, 24 Mar 2022 01:53:25 -0700 (PDT)
Received: from bojack.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adffb07000000b002058a53f359sm2036154wrr.58.2022.03.24.01.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 01:53:24 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robert.foss@linaro.org, andrzej.hajda@intel.com,
 Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH 0/3] drm: bridge: it66121: Add audio support
Date: Thu, 24 Mar 2022 09:53:22 +0100
Message-Id: <164811198461.361879.12488552321734676872.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316135733.173950-1-nbelin@baylibre.com>
References: <20220316135733.173950-1-nbelin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 16 Mar 2022 14:57:30 +0100, Nicolas Belin wrote:
> This patch series adds the audio support on the it66121 HDMI bridge.
> 
> Patch 1 updates the ITE 66121 HDMI bridge bindings in order to support
> audio.
> 
> Patch 2 sets the register page length or window length of the ITE 66121
> HDMI bridge to 0x100 according to the documentation.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] dt-bindings: display: bridge: it66121: Add audio support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=cc2f2df48a17980e815fa09a43b81861f7ebad85
[2/3] drm: bridge: it66121: Fix the register page length
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=003a1bd6a2a55c16cb2451153533dbedb12bebec
[3/3] drm: bridge: it66121: Add audio support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e0fd83dbe92426e4f09b01111d260d2a7dc72fdb

-- 
Neil
