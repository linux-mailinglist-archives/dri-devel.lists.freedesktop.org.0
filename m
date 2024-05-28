Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A118D204B
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 17:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC87810E27A;
	Tue, 28 May 2024 15:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HCvBDtlM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5797E10E1C8;
 Tue, 28 May 2024 15:23:48 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1f4a6a54416so6580055ad.0; 
 Tue, 28 May 2024 08:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716909828; x=1717514628; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9GZ82+6X/m8/WJiwoeD4lBp/SWA2880Fz0PinrORm+A=;
 b=HCvBDtlMrgVcms5cNJqfZx9y8LxNyJ6Xb5gYZaza4hcn2djnbc95Y7VpciahfOrxqA
 jlOcqOmbS3UcUwmN5Y/J2NbgE7UvYFcg5muIiwRMnMDswytkTvjt1LxKmfXZAXznNhow
 xnE6xQCfaauK4a9c29uaNgzVOgXyX7id8PMtG++c3Qc+JNTJPDawsEcyf9hzSwL+1N9e
 H9oWoNLqHkB8wnzOoYvMADXCin5rPdnQpx7dfJ+JSQ383UYpkNOK/DLQrpUrW+DNJh5J
 CVVmqyOiYrefBK8cN25aK+7+3A6RkPbGG2JbY4/V4zKpARbhNKZEKBO2isv4oPwd3vGB
 gG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716909828; x=1717514628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GZ82+6X/m8/WJiwoeD4lBp/SWA2880Fz0PinrORm+A=;
 b=tAJa+56vChpdb0vWJTOLrQ0rWq+bDTL1iop4fw04gL9UyVfwxOsvFzxbZNZtZZ7bP+
 aHBTSjwb2yXQSypzEIKCYtmQvvcmdt8VKlGgLFYv3Vj+UkNagXdg5yCJvRJ72d2mTA6q
 4m+cTdbMXLr2h8zmilj25dfB1nkBkiCTWne/cICxEU2BMKN3HTfVetCrkcpO22yKg3iE
 FNSlu6hIHSOKOCFyHpYOFwycXjYcNVgq8xvXL8g+BWnINKVe0k9EF7LEdfmQtMz8xZA0
 lQGvdEMdJPONN5xbaXdseFaj8nuTm6fRvvnlOZ9BKYekR0oLh7l+VxeDPdO4k9M9S474
 xGsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf94p3KJLdT9hROktGNBB6AdhSg3cg5uny5rHmOeCeCHTG5wiVx1rVjrt3tv8/KLnEcLr0etmEB2Ibbt5uPHm4bw1tW78i4mIapsxc9duQW6MJwS7AwV5j5DuhJnxqQ8XSqn3kvsWWJ5tml3IweA==
X-Gm-Message-State: AOJu0YzCpyNLLLVjw10/ovjSk87ds40zZLVf2ahz3V/RVMb8zQqmNhVi
 H8ndrcRfm5uL6xFXAuY3HYcPId2QjhAl+g93TDcQGbi+S99Y7icRe0VXe5Ze+c/R7iDdpT/KNqr
 PLsqRS69QoWxBVEvy+JMVOd/fxmY=
X-Google-Smtp-Source: AGHT+IFzNXDUZW+UVGdJz4b1hVU9pW6xiuihea/LYhjhoIqtktFL6NfYLHOdq4dJm9ZXLqpgwzKoRhQLsCdMWo/5mfY=
X-Received: by 2002:a17:902:e5cd:b0:1f4:913d:7257 with SMTP id
 d9443c01a7336-1f4913d8295mr96471125ad.8.1716909827697; Tue, 28 May 2024
 08:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240528131026.214773-1-brunolevilevi@usp.br>
 <20240528131026.214773-3-brunolevilevi@usp.br>
In-Reply-To: <20240528131026.214773-3-brunolevilevi@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 May 2024 11:23:36 -0400
Message-ID: <CADnq5_PrP7jVyyJ85TZyRnpFVb5rVzPJ2vY78ZZp+YVSoneJZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drivers/gpu: Fix misalignment in comment block
To: Bruno Rocha Levi <brunolevilevi@usp.br>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, 
 Lucas Antonio <lucasantonio.santos@usp.br>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, May 28, 2024 at 10:47=E2=80=AFAM Bruno Rocha Levi <brunolevilevi@us=
p.br> wrote:
>
> This patch fixes a warning from checkpatch by ensuring the trailing */ is
> aligned with the rest of the *, improving readability.
>
> Co-developed-by: Lucas Antonio <lucasantonio.santos@usp.br>
> Signed-off-by: Lucas Antonio <lucasantonio.santos@usp.br>
> Signed-off-by: Bruno Rocha Levi <brunolevilevi@usp.br>
> ---
>  drivers/gpu/drm/amd/acp/include/acp_gfx_if.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/acp/include/acp_gfx_if.h b/drivers/gpu/d=
rm/amd/acp/include/acp_gfx_if.h
> index feab8eb7f..b26710cae 100644
> --- a/drivers/gpu/drm/amd/acp/include/acp_gfx_if.h
> +++ b/drivers/gpu/drm/amd/acp/include/acp_gfx_if.h
> @@ -19,7 +19,7 @@
>   * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>   * OTHER DEALINGS IN THE SOFTWARE.
>   *
> -*/
> + */
>
>  #ifndef _ACP_GFX_IF_H
>  #define _ACP_GFX_IF_H
> --
> 2.45.1
>
