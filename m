Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362F717DA6B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18166E339;
	Mon,  9 Mar 2020 08:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874E2895F5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 06:55:26 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n7so9529110wrt.11
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2020 23:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:subject:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dm/e7fVVkyUEJNRr/yTEUzT0xvOhNYWpgvQvhHUhF68=;
 b=s3VbLfphTDUMOj5VgEB+bJaxg9XNGT89jpF7/fzn4h2lZjtBN2yMNm+e2Mk1q3vVbz
 2hu8irwSULuWR6uM43Wv53RBYq6D8D2BBoG3YD6ovjl857cnhxhwjSTQ0PQTELIqogKQ
 /yyn6SfIz769wKub7xSny0zSlNeUbAq7qpI5RPwFPuVZ4IGqm67Sdov8lAwKUL+koX53
 5kYAbSbYqLJrm/u2YaUvrq24vjlONNNEgpvHIGRtuzx++/LgRQmjp0JJgmQAqtAdfLkJ
 YpY1lGAWis9ADEi+SJCUaE0woOUY9hR3uXmr8drGmY4IegRi4kKBxCRU8B6pzqkrVbkY
 uBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:subject:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dm/e7fVVkyUEJNRr/yTEUzT0xvOhNYWpgvQvhHUhF68=;
 b=nvEkT2ciUV0IZ+487I5bL3HkETuUMvb7vbGMkL/GeOtt6UyeySAMYPBShxvC7jAftQ
 5YcBVNTvW9g+Z8Ec7VVB8r/CW9rM1bSJQkne8ps+rvwD4eZ7uIc+AkUQi3dbLdYcLGXX
 bStsiKBHJW3ro5LaVTzX/4uzia+ECj5fhRXyvx8HitbPqbrrIKuEdSFfgxM1f3crRHcX
 9GXc6iTOpVl1J05utbn/xNgr0eD7ehhk5rXIWt3G9KUzcUcIbYamZge+EDt5l+FOVep+
 H428we4CVVKVkEbySu7Py31NE7uxZk49CfIdJL3kwriSC3R5ZlgOX2iugbKzExXWafSG
 NKyA==
X-Gm-Message-State: ANhLgQ3CQLxJmnZUTRnkUfSNJz5xpCUUNgwgOa/XZ/SaMctPDcz5Nr24
 FcwIu9l1hqYj9pf7walCwnw=
X-Google-Smtp-Source: ADFU+vuCkgUSr5KTXA5g4+RQ2G5B4vEX0HXc+ZOFzelH2n6p5QuIzylG840VCzpvNwVRkr+/89Abxw==
X-Received: by 2002:adf:80af:: with SMTP id 44mr19311433wrl.241.1583736925115; 
 Sun, 08 Mar 2020 23:55:25 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id l5sm24320597wml.3.2020.03.08.23.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2020 23:55:24 -0700 (PDT)
To: jbx6244@gmail.com
References: <20200306170353.11393-1-jbx6244@gmail.com>
Subject: Re: [PATCH v1] dt-bindings: display: rockchip: convert rockchip vop
 bindings to yaml
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <590762ab-db79-c8b1-7f0e-b653ed4b1721@gmail.com>
Date: Mon, 9 Mar 2020 07:55:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200306170353.11393-1-jbx6244@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 09 Mar 2020 08:13:37 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Question for robh:

In the old txt situation we add/describe only properties that are used
by the driver/hardware itself. With yaml it also filters things in a
node that are used by other drivers like:

assigned-clocks:
assigned-clock-rates:
power-domains:

Should we add or not?

Kind regards,

Johan

PS: Will drop 'rockchip,grf' in v2 for px30, not used in vop driver?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
