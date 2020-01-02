Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2054912E4DD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BF36E02D;
	Thu,  2 Jan 2020 10:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C0C6E02D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 10:17:22 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id i23so29591473lfo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 02:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+i1xRykP5uv9X8ny4A0J+Qps3PIBxztMEkk3ewgFGA=;
 b=vM8v/vmdGQCKaZpPhBATGVmk7XhHVJTWBTVqXUPFl24NXuIe6gv+WZwBGJqW8O1c3y
 loe6323y+s6fWCC1ZqmyXBJcMrGmZldshtSFEUI0N++5eFxP5gKuCrx+TP/iHxg/duf2
 P2Cvt3UUqUIp2xJbA3RWX+PPoQc96e9Wzr+44dHJ8sqwZxiD28KuW2xzNRmJFEBHPC9K
 2q1zi81qma/Ei8u7S5LttHR+xfdjYz9dFB2tbxMZ9/h6xMVr92yAjA1VCZpejs5PY0se
 pAODJiDeNgYdDHpBj9vBRLZeBU/3gouz5mQRhACHUDUmZleFsy8ijP0XgQ8gKOey4Z1d
 j0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9+i1xRykP5uv9X8ny4A0J+Qps3PIBxztMEkk3ewgFGA=;
 b=QxrU9mkZ9V2nUj97krGZ9EEmPbjRtpllaPYWHcod1koXE9cerJ3UW3rmeiM4fNH9hX
 iTzLQgVWVoCB2fHmPXfwfdY5/TaV88pp9bHUD62p2i+JTxHkRepn8oWXa2BnyozDnkTD
 HElPIDHmXghqUrGfymjA1RUTGMcUi8CRdU/ehOzrAHbfiCQotQn179E0GZ3nvbWD4Ev4
 H8Xbzj9BGEjydATLXj54T9RJFOsQnQb96ulCetmz2tv+fz3FROze4kpAUC/mb0EDaLgt
 NwpPDx//+zhLw75dRHBBmzsn0KpoV8FKXRXk/BVAOEaxQyPOMgLffxnaBCyb2zcSuTGb
 DgVA==
X-Gm-Message-State: APjAAAWedJLbJPx8ZkfTmJMcg9E2H6yhKHzM7G3dC9AuJFHMcQBpAN/k
 37nNEnNzoIj1lFK4ff6XBIcdc8D9
X-Google-Smtp-Source: APXvYqymNyc0QLFnUptpOrq0JxPbqMdtMbzqFjc2QtF0PLfXsINKI71/OMdHVF6jfoSQdtFGWB8kww==
X-Received: by 2002:ac2:43a7:: with SMTP id t7mr43352664lfl.125.1577960241084; 
 Thu, 02 Jan 2020 02:17:21 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 m21sm23025892lfh.53.2020.01.02.02.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 02:17:20 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/2] combine bindings for simple panels in a few files
Date: Thu,  2 Jan 2020 11:17:10 +0100
Message-Id: <20200102101712.5085-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset introduces two files:

    panel-simple.yaml
    panel-simple-dsi.yaml

The two files will be used for bindings for simple
panels that have only a single power-supply.

For now only a few bindings are migrated - the
reamining bindings will be migrated when we have agreed
on the format.

v2:
  - updated binding description in panel-simple.yaml
  - fixed exampe in panel-simple.yaml
    (I was missing libyaml-dev - now the examples are checked properly here)
  - added panel-simple-dsi.yaml

	Sam 

Sam Ravnborg (2):
      dt-bindings: one binding file for all simple panels
      dt-bindings: one file of all simple DSI panels

 .../display/panel/ampire,am-480272h3tmqw-t01h.yaml | 42 --------------
 .../display/panel/ampire,am800480r3tmqwa1h.txt     |  7 ---
 .../display/panel/panasonic,vvx10f034n00.txt       | 20 -------
 .../bindings/display/panel/panel-simple-dsi.yaml   | 67 ++++++++++++++++++++++
 .../bindings/display/panel/panel-simple.yaml       | 59 +++++++++++++++++++
 5 files changed, 126 insertions(+), 69 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
